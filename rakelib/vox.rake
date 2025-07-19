# frozen_string_literal: true

namespace :vox do
  desc 'Update the version in preparation for a release'
  task 'version:bump:full', [:version] do |_, args|
    abort 'You must provide a tag.' if args[:version].nil? || args[:version].empty?
    version = args[:version]
    unless Gem::Version.correct?(version)
      abort "#{version} does not appear to be a valid version string in x.y.z format"
    end
    # Update lib/bolt/version.rb and openbolt.gemspec
    puts "Setting version to #{version}"

    data = File.read('lib/bolt/version.rb')
    new_data = data.sub(/VERSION = '\d+\.\d+\.\d+(-\w+(\..*)?)?'/, "VERSION = '#{version}'")
    if data == new_data
      warn 'Failed to update version in lib/bolt/version.rb'
    else
      File.write('lib/bolt/version.rb', new_data)
    end

    data = File.read('openbolt.gemspec')
    new_data = data.sub(/(spec.version *=) '\d+\.\d+\.\d+(-\w+(\.\w+)?)?'/, "\\1 '#{version}'")
    if data == new_data
      warn 'Failed to update version in openbolt.gemspec'
    else
      File.write('openbolt.gemspec', new_data)
    end
  end
end
