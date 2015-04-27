def get_ruby_version
  ruby_version_file = ".ruby-version"
  if File.exists?(ruby_version_file)
    File.read(ruby_version_file)
  else
    abort("Please provide a '.ruby-version' file with a ruby version supported by Uberspace.")
  end
end

namespace :uberspace do
  desc "Install one of uberspace's rubies in your $PATH"
  task :ruby do
    ruby_version = fetch(:ruby_version, -> { get_ruby_version })
  end
end
