#!/bin/bash
gem build kele.gemspec

gem install kele-0.0.1.gem

pry irb_setup.rb