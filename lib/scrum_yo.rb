require 'octokit'
require 'colorize'
require 'active_support/inflector'
require 'active_support/time'
require 'active_support/time_with_zone'
require 'scrum_yo/activity'
require 'scrum_yo/output'
require 'scrum_yo/user'
require 'string_hacks'

module ScrumYo
  class CLI
    def self.start(*args)
      puts "Happy #{DateTime.current.strftime('%A')}!\n"
      puts "Grabbing your recent GitHub Activity...\n".rainbow
      ScrumYo::Output.new.print
    end
  end
end
