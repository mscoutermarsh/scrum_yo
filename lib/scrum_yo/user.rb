require 'highline/import'
require 'netrc'
require 'pry-debugger'

# Uses credentials in .netrc to authenticate user
# If not authenticated, asks for credentials and stores
# oauth token in .netrc for future auth
module ScrumYo
  class User
    attr_reader :github_client, :username, :emails

    def initialize
      authenticate unless logged_in?
      @github_client = Octokit::Client.new(netrc: true)
      @username = @github_client.login
      @emails = @github_client.emails
    end

    def authenticate
      logged_in? || get_credentials
    end

    def get_credentials
      username, password = github_credentials
      client = Octokit::Client.new(login: username, password: password)

      if agree('Do you use Two Factor Auth? (y/n)')
        two_factor = ask('Enter your 2FA token:')
        oauth = create_authorization(client, {"X-GitHub-OTP" => two_factor})
      else
        oauth = create_authorization(client)
      end

      save_to_netrc(username, oauth.token)

      if logged_in?
        return true
      else
        puts "Authentication failed".red if logged_in
        get_credentials
      end
    end

private
    def github_credentials
      puts "Please login with your Github account.".yellow
      username = ask("Github Username:")
      password = ask('Password (typing hidden):') { |q| q.echo = false }
      [username, password]
    end

    def create_authorization(client, headers = {})
      client.create_authorization(scopes: ['user','repo'], note: 'ScrumYo gem!', headers: headers)
    end

    def save_to_netrc(user, token)
      netrc = Netrc.read
      netrc.new_item_prefix = "# This entry was added by the ScrumYo gem\n"
      netrc['api.github.com'] = user, token
      netrc.save
    end

    def logged_in?
      netrc = Netrc.read
      netrc['api.github.com'] && Octokit::Client.new(netrc: true).login
    end
  end
end
