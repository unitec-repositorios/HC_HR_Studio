bundle install
git pull origin master
rake db:migrate
rails s -e development -b 0.0.0.0 -p 2200
