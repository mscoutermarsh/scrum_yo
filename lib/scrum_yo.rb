require 'octokit'
require 'colorize'
require 'scrum_yo/activity'
require 'scrum_yo/output'
require 'scrum_yo/user'
require 'string_hacks'

module ScrumYo
  class CLI
    def self.start(*args)
      puts "ScrumYo!".rainbow
      ScrumYo::User.new.authenticate

      puts "Happy #{Time.now.strftime('%A')}!\n"
      puts "Grabbing your recent GitHub Activity...\n".rainbow
      ScrumYo::Output.new.print
    end
  end
end
