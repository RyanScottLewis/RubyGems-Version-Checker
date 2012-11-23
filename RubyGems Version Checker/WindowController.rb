#
#  WindowController.rb
#  RubyGems Version Checker
#
#  Created by Ryan Scott Lewis on 11/23/12.
#  Copyright 2012 Lewis Software. All rights reserved.
#


class WindowController < NSWindowController
    attr_accessor :input_search_field
    attr_accessor :output_view
    attr_accessor :output_text_field
    
    def input_update_filter(sender)
        @input_search_field.hidden = true
        @output_view.hidden = false
        
        name = @input_search_field.stringValue.strip
        
        req = Gem::Requirement.default
        # TODO: deprecate for real
        dep = Gem::Deprecate.skip_during { Gem::Dependency.new(name, req) }
        
        fetcher = Gem::SpecFetcher.fetcher
        spec_tuples = fetcher.find_matching(dep, false, false, false)
        
        results = spec_tuples.each_with_object({}) do |(spec_tuple, _), memo|
            name, version = spec_tuple[0], spec_tuple[1].to_s
            
            memo[name] ||= []
            memo[name] << version
        end
        
        result = if results.has_key?(name)
            version = results[name].first
            
            "#{name} ~> #{version}"
        end
    
        result ||= ''
        
        @input_search_field.stringValue = ''
        @output_text_field.stringValue = result
        @input_search_field.selectText(self)
    end
    
    def output_exit_button_clicked(sender)
        @input_search_field.hidden = false
        @output_view.hidden = true
        
        @output_text_field.stringValue = ''
    end
end