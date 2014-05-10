module ScrumYo
  class Activity
    attr_reader :github_activity, :user

    def initialize
      @user = ScrumYo::User.new
      @github = @user.github_client
      @github_activity = load_activities
    end

    private

    def load_activities(page = 1)
      activities = @github.user_events(@user.username, page: page)

      if older_than_one_day(activities.last)
        return filter_activity(activities)
      else
        # recursion alert! get events from next page
        activities.push(*load_activities(page + 1))
      end
    end

    def older_than_one_day(event)
      # 3600 = seconds in an hour
      (DateTime.now.in_time_zone('UTC') - event.created_at) / 3600 > 24
    end

    def filter_activity(events)
      events.select! { |e| %w{PushEvent PullRequestEvent}.include? e.type }

      events.each do |event|
        if event.payload.commits
          event.payload.commits.select! { |commit| @user.emails.include? commit.author.email }
        end
      end

      events
    end

  end
end
