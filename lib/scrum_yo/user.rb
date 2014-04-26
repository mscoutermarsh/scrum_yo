module ScrumYo
  class User
    attr_reader :github_client, :username, :emails

    def initialize
      # Uses credentials in .netrc to authenticate
      @github_client = Octokit::Client.new(netrc: true)
      @username = @github_client.login
      @emails = @github_client.emails
    end

    def time_zone
      Time.zone = DateTime.now.utc_offset / 60 / 60
      Time.zone.name
    end
  end
end
