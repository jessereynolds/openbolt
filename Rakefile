# frozen_string_literal: true

# rubocop:disable Lint/SuppressedException
begin
  # Needed for Vanagon component ship job. Jenkins automatically sets 'BUILD_ID'.
  # Packaging tasks should not be loaded unless running in Jenkins.
  if ENV['BUILD_ID']
    require 'packaging'
    Pkg::Util::RakeUtils.load_packaging_tasks
  end
rescue LoadError
end
# rubocop:enable Lint/SuppressedException

begin
  require 'github_changelog_generator/task'
  require_relative 'lib/bolt/version'

  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    config.header = <<~HEADER.chomp
      # Changelog

      All notable changes to this project will be documented in this file.
    HEADER
    config.user = 'openvoxproject'
    config.project = 'openbolt'
    config.exclude_labels = %w[dependencies duplicate question invalid wontfix wont-fix modulesync skip-changelog]
    config.future_release = Bolt::VERSION
    # we limit the changelog to all new openvox releases, to skip perforce onces
    # otherwise the changelog generate takes a lot amount of time
    config.since_tag = '4.0.0'
  end
rescue LoadError
  task :changelog do
    abort('Run `bundle install --with release` to install the `github_changelog_generator` gem.')
  end
end

desc 'Prepare for a release'
task 'release:prepare' => [:changelog]

desc "Check for new versions of bundled modules"
task :update_modules do
  sh "scripts/update_modules.rb"
end

begin
  require 'voxpupuli/rubocop/rake'
rescue LoadError
  # the voxpupuli-rubocop gem is optional
end
