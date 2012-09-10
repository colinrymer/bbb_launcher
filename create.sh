#!/bin/bash
set -x

rm -rf bbb_launcher
rails new bbb_launcher
cd bbb_launcher/

echo '
gem "twitter-bootstrap-rails", :group => :assets
gem "simple_form"
gem "bbb_api"
gem "debugger", group: [:development, :test]
' >> Gemfile

bundle

rails g bootstrap:install
rails g simple_form:install --bootstrap
rails g bootstrap:layout application fixed -f

rails g scaffold room name welcome moderator_pw viewer_pw recorded:boolean --skip-stylesheets
rake db:migrate
rails g bootstrap:themed Rooms -f

rails g scaffold sessions name start_time moderators viewers recorded:boolean
rake db:migrate
rails g bootstrap:themed Sessions -f

#patch app/views/layouts/application.html.erb < ../application.html.erb.patch
#patch app/views/rooms/index.html.erb < ../index.html.erb.patch
#rails server

