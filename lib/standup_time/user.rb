class User
  attr_reader :github_client

  def initialize
    # Uses credentials in .netrc to authenticate
    @github_client = Octokit::Client.new(netrc: true)
    @username = @github_client.login
  end
end
