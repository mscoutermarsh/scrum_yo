class Activity
  def initialize
    @user = User.new
    @github = @user.github_client
  end

  def print(hours_of_history = 24)
    time = (Time.now - hours_of_history.hours).in_time_zone('UTC')
    events = events(time, 0)
    binding.pry
    events.each do |e|
      puts e.created_at
    end
  end

private

  def events(start_time, page = 0)
    results = @github.user_events(@username, page: page)

    if results.last.created_at > start_time
      results.push(*events(start_time, page + 1))
    else
      return results
    end
  end

  # Only show commits authored by current user
  def clean_push_event(event)
    event.payload.commits.select! { |commit| @user.emails.include? commit.author.email }
  end
end
