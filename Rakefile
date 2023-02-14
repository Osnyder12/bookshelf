# frozen_string_literal: true

require "hanami/rake_tasks"

# docs did not include these require statments
# had to include to run bundle exec rake db:setup and the create_migration tasks
require 'rom/sql/rake_task'
require "hanami/prepare"

task :environment do
  require_relative "config/app"
  require "hanami/prepare"
end

namespace :db do
  task setup: :environment do
    Hanami.app.prepare(:persistence)
    ROM::SQL::RakeSupport.env = Hanami.app["persistence.config"]
  end
end