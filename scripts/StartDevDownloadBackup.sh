bundle install
git pull origin MaquinaVirtual
rake db:migrate
./backup.sh
rails s -e development -b 0.0.0.0 -p 2200