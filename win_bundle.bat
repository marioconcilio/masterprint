@ECHO OFF
@ECHO - Stopping servers
net stop Redis
net stop ThinServerFirst
net stop ThinServerSecond

@ECHO - Updating gems

ruby -S bundle install
ruby -S gem uninstall bcrypt-ruby
ruby -S gem uninstall bcrypt
ruby -S gem install bcrypt --platform=ruby

@ECHO - Starting servers
net start Redis
net start ThinServerFirst
net start ThinServerSecond