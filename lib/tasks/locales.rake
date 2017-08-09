namespace :masterprint do
  desc 'Start rails and redis server on development'
  task :start do
    exec 'redis-server & rails s'
  end

  task :deploy do
    # if windows
    if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
      puts 'Stopping servers'
      exec 'net stop Redis'
      exec 'net stop ThinServerFirst'
      exec 'net stop ThinServerSecond'

      puts 'Installing bcrypt for windows'
      exec 'gem uninstall bcrypt-ruby'
      exec 'gem uninstall bcrypt'
      exec 'gem install bcrypt --platform=ruby'
    end

    puts 'Precompiling assets'
    Rake::Task['assets:precompile'].invoke

    puts 'Starting servers'
    # if windows
    if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
      exec 'net start Redis'
      exec 'net start ThinServerFirst'
      exec 'net start ThinServerSecond'
    else
      exec 'redis-server & thin start -e production'
    end
  end
end
