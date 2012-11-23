//
//  main.m
//  RubyGems Version Checker
//
//  Created by Ryan Scott Lewis on 11/23/12.
//  Copyright (c) 2012 Lewis Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
