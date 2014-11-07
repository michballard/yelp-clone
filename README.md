| [Makers Academy](http://www.makersacademy.com) | Week 9 | 
| ------ | ------ | 

Yelp Clone
==========

This project to recreate Yelp was done as an introduction to Ruby on Rails.  

Technologies used
-----------------
<strong>Build</strong>
- Ruby
- Rails
- HTML
- CSS
- Postgres
- Javascript
- jQuery
- Devise
- Omniauth-Twitter
- Omniauth-Facebook
- Paperclip
- AWS

<strong>Testing</strong>
- Rspec
- Capybara
- Poltergeist
- Launchy

## How to run this app

Clone this repository:
```shell
$ git clone git@github.com:michballard/yelp-clone.git
```
Install gems:
```shell
$ bundle install
```

Create database repositories:
```
$ psql
# CREATE DATABASE "yelp_clone_test";
# CREATE DATABASE "yelp_clone_development";
# \q
```

Start server from command line:
```shell
$ bin/rails s
```

View app in browser by typing:
```
localhost:3000
```
