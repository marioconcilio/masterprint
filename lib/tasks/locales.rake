require 'redis'

namespace :masterprint do
  desc 'Start rails and redis server on development'
  task :start do
    exec 'redis-server & rails s'
  end
end
