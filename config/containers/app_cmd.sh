#!/usr/bin/env bash

bundle exec unicorn -c config/containers/unicorn.rb -E $RAILS_ENV;
