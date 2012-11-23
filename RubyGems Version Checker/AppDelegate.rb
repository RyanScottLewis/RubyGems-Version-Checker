#
#  AppDelegate.rb
#  RubyGems Version Checker
#
#  Created by Ryan Scott Lewis on 11/23/12.
#  Copyright 2012 Lewis Software. All rights reserved.
#

class AppDelegate
    attr_accessor :window
    
    def applicationDidFinishLaunching(a_notification)
        Gem::SpecFetcher.fetcher.list # Preload all specs from rubygems.org by "listing" them here
    end
end

