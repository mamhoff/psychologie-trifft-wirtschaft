def get_ruby_version
  ruby_version_file = ".ruby-version"
  if File.exists?(ruby_version_file)
    File.read(ruby_version_file).strip
  else
    abort("Please provide a '.ruby-version' file with a ruby version supported by Uberspace.")
  end
end

namespace :uberspace do
  desc "Prepare your Uberspace to play with your ruby version automagically"
  task :prepare do
    invoke("uberspace:ruby")
    invoke("uberspace:gemrc")
    invoke("uberspace:bundler")
  end

  task :ruby do
    ruby_version = fetch(:ruby_version, -> { get_ruby_version })
    path_settings = <<-END
export PATH=/package/host/localhost/ruby-#{ruby_version}/bin:$PATH
export PATH=$HOME/.gem/ruby/#{ruby_version}/bin:$PATH
END
    on roles(:web) do
      # Remove old rubies
      execute "sed -i '/\\\/ruby-/d' .bashrc"
      execute "echo '#{path_settings}' >> .bashrc"
    end
  end

  task :gemrc do
    on roles(:web) do
      execute 'echo "gem: --user-install --no-rdoc --no-ri" > ~/.gemrc'
    end
  end

  task :bundler do
    on roles(:web) do
      execute 'gem install bundler'
      execute 'bundle config path ~/.gem'
    end
  end
end
