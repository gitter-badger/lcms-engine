# frozen_string_literal: true

Spring.application_root = ''

%w(
  .ruby-version
  tmp/restart.txt
  tmp/caching-dev.txt
).each { |path| Spring.watch(path) }
