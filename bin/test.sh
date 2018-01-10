#!/bin/bash
bundle exec rubocop
if [ $? -ne 0 ] ; then
   exit 1
fi
bundle exec rake db:migrate
bundle exec rspec --format documentation