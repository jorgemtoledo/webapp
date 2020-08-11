# WebApp

This is a project to control the hours worked by interns at the company

## Technology 

Here are the technologies used in this project.

* Ruby version  2.5.1
* Ruby on Rails version 6.0.3
* Docker 
* Docker Compose
* Mysql

## Getting started

* Dependency
  - Docker
  - Docker Compose

* To build the containers:
>    $ sudo docker-compose build

* To create the bank and do as migrations:
>    $ sudo docker-compose run --rm app bundle exec rake db:create db:migrate

* To install as gens:
>    $ sudo docker-compose run --rm app bundle install

* To test rspec:
> $ sudo docker-compose run --rm app bundle exec rspec 

* To run the project:
>    $ sudo docker-compose up

## Features

The main features of the app are;

* Control the hours worked by interns 

## Author

* **Jorge Toledo**
