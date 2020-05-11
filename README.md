# README

## Bootstrapping

These instructions assume an Ubuntu machine, specifically 20.04, but any recent
version should probably work.

```bash
# Set up rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
echo 'export PATH="~/.rbenv/bin:$PATH" >> ~/.bashrc
echo 'eval $(rbenv init -)` >> ~/.bashrc
source ~/.bashrc

# Install the correct Ruby version
rbenv install 2.6.5
gem install bundler -v 2.1.4

# Install Yarn
sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo sh -c "echo 'deb https://dl.yarnpkg.com/debian/ stable main' >> /etc/apt/sources.list"
sudo apt update
sudo apt install yarn

# Install Postgres, and configure it
sudo apt install postgresql libpq-dev
sudo -u postgres createuser $USER
sudo -u postgres createdb $USER

# Install application dependencies
bundle install
yarn install --check-files

# Initial setup
rake db:setup

# And finally see if the specs pass
rspec
```