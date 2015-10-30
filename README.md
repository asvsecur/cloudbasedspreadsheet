Installation
======

### Installing Ruby on Rails on Ubuntu/Debian
Follow the following [link](https://gorails.com/setup/ubuntu/13.10) to install ROR on your Ubuntu or Debian machine. 

### Get Source code

Clone the source from git from [here](https://github.com/bksriharsha/cloudbasedspreadsheet) using the command, 

    git clone https://github.com/bksriharsha/cloudbasedspreadsheet.git
     


### Installing all dependent gems
To install all the dependent gems needed for running the  site, run the following command.

    bundle install
    


### Setting up the development environment

Run the following command to tell Rails to setup the database.

    rake db:create db:migrate
    

### Running the Rails Server
Start the server using the following command. 

    rails server

After this, the website should be running at http://localhost:3000    

### Setting an admin user

Run the following command to tell Rails to setup the admin user.

    rails console
    > User.find_by_name('<user name>').update_attribute(:admin, true)
        

### Setting up forgot password mailer
    Open file https://github.com/bksriharsha/cloudbasedspreadsheet/blob/master/config/environments/production.rb
    
    Update -
    'Your site URL' with "your site"
    "GMAIL_DOMAIN" with "gmail.com"
    "GMAIL_USERNAME" with "your username"
    "GMAIL_PASSWORD" with "your password"
    


