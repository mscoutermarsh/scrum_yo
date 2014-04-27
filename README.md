![scrum yo](https://raw.githubusercontent.com/mscoutermarsh/scrum_yo/master/scrum_art.png)

Be awesome at your daily stand up. Get a summary of your most recent GitHub commits & pull requests right in your console.

ScrumYo uses the GitHub API to grab your recent commits/pull requests.

### Screenshot
![example of scrumyo](https://raw.githubusercontent.com/mscoutermarsh/scrum_yo/master/scrumyo_example.png)

## Installation

    $ gem install scrum_yo
    
If using RVM, install it to your global gemset:

    $ rvm @global do gem install scrum_yo


## Usage

There is only one command! To see your recent activity:

    $ scrumyo

You'll have to login to your GitHub account on first use.
    
## Authentication

You'll be asked to login to GitHub your first time using ScrumYo. This creates an OAuth token to be used for subsequent logins. Oauth token is saved to your ```~/.netrc``` file. 

## Contributing

1. Fork it ( http://github.com/mscoutermarsh/scrum_yo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
