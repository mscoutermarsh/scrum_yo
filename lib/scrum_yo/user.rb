require 'highline/import'
require 'netrc'

module ScrumYo
  class User
    attr_reader :github_client, :username, :emails

    def initialize
      # Uses credentials in .netrc to authenticate
      @github_client = Octokit::Client.new(netrc: true)
      @username = @github_client.login
      @emails = @github_client.emails
    end

    def authenticate(logged_in = false)
      return true if logged_in?

      puts "Authentication failed".red if logged_in
      get_credentials
    end

    def get_credentials
      puts "Please login with your Github account.".yellow
      username = ask("Github Username:")
      password = ask('Password (typing hidden):') { |q| q.echo = false }

      client = Octokit::Client.new(login: username, password: password)


      if agree('Do you use Two Factor Auth? (y/n)')
        two_factor = ask('Enter your 2FA token:')
        oauth = oauth_authorization(client, headers: {"X-GitHub-OTP" => two_factor})
      else
        oauth = oauth_authorization(client)
      end

      save_to_netrc(username, oauth.token)
      authenticate(true)
    end

private
    def oauth_authorization(client, headers = {})
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
