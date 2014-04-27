module ScrumYo
  class Output
    def initialize
      @activity = ScrumYo::Activity.new
      @activities = @activity.github_activity
    end

    def print
      @activities.reverse.each do |event|
        print_day(event)
        case event.type
        when 'PushEvent'
          print_push(event)
        when 'PullRequestEvent'
          print_pull_request(event)
        end
      end
    end

    private

    def print_day(event)
      day = "#{event.created_at.strftime('%a, %b %e')}"

      puts day.green unless @current_day == day
      @current_day = day
    end

    def print_push(event)
      commits = event.payload.commits
      return if commits.size == 0

      event_time = format_time(event.created_at)

      puts "#{event_time}: Pushed to: #{event.repo.name}".indent(2).red
      puts "Commit #{'message'.pluralize(commits.size)}:".indent(4).yellow

      print_commits(commits)
    end

    def print_commits(commits)
      commits.each do |commit|
        puts "#{commit.message}\n\n".indent(4)
      end
    end

    def print_pull_request(event)
      event_time = format_time(event.created_at)

      puts "#{event_time}: #{event.payload.action} Pull Request on #{event.repo.name}".indent(2).red
      puts "#{event.payload.pull_request.title}\n".indent(4).yellow
    end

    def format_time(time)
      time = time + Time.now.utc_offset
      time.strftime('%l:%M %p')
    end
  end
end
