![scrum yo](https://raw.githubusercontent.com/mscoutermarsh/scrum_yo/master/scrum_art.png)

Be awesome at your daily stand up. Get a summary of your most recent GitHub commits & pull requests right in your console. 
## Installation

    $ gem install scrum_yo
    
If using RVM, install it to your global gemset:

    $ rvm @global do gem install scrum_yo
    
ScrumYo uses the GitHub API to grab your recent commits/pull requests.


## Usage

There is only 1 command! To see your recent activity:

    $ scrumyo
    
## Authentication

You'll be asked to login to GitHub your first time using ScrumYo. Credentials are then saved to your ```~/.netrc``` file. You should use a [personal access token](https://github.com/settings/tokens/new) instead of your password!

## Contributing

1. Fork it ( http://github.com/mscoutermarsh/scrum_yo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
