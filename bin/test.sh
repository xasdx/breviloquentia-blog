#!/bin/bash
bundle exec rubocop
bundle exec rake db:migrate
bundle exec rspec --format documentation