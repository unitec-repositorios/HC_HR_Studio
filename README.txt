How To Run HR_Studio

Instructions tested and approved for:

Ruby Version: 2.4.0
Rails Version: 5.1.4
Linux Versions: 
Linux Mint 18.1 Serena

For further consults on how to download Ruby and/or Rails:
https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rvm-on-ubuntu-16-04

1. Download and install postgresql

One way to do so: step by step

$ wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -

$ sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

$ sudo apt-get update

$ sudo apt-get install postgresql postgresql-contrib

$ sudo apt-get install libpq-dev

Check to see if you have Imagemagick in the computer, is used for handling the images. If not you can install it with the following command.

$ sudo apt-get install imagemagick

2. Download Project

Go to preferred directory

$ git clone *copy bitbucket link*

2. Install dependencies and configure database

$ rvm --default use 2.4.0
$ bundle install 
$ rake db:drop
$ rake db:create
$ rake db:schema:load
$ rake db:seed
$ rake db:migrate
