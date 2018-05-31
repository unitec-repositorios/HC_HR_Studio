RAILS_ENV=production bundle exec rake assets:precompile
rake db:drop RAILS_ENV=production
rake db:create RAILS_ENV=production
rake db:schema:load RAILS_ENV=production
rake db:seed RAILS_ENV=production
rake db:migrate RAILS_ENV=production
