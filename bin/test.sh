#!/bin/bash
bundle exec rake db:migrate
bundle exec rspec --format documentation