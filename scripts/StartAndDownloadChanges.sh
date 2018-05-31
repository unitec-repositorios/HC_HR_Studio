git pull origin master
rake db:migrate RAILS_ENV=production
rails s -e production -b 0.0.0.0 -p 2200
