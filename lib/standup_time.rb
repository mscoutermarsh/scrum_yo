require 'octokit'
require 'active_support/time'
require 'active_support/time_with_zone'
require 'standup_time/version'
require 'standup_time/user'
require 'standup_time/activity'

module StandupTime
  # Your code goes here...
  class CLI
    def self.start(*args)
      Activity.new.print
    end
  end
end
