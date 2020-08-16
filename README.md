# WebApp

This is a project to control the hours worked by interns at the company

## Technology 

Here are the technologies used in this project.

* Ruby version  2.5.8
* Ruby on Rails version 6.0.3
* Docker 
* Docker Compose
* Mysql
* Gems (devise, cancancan, rails-i18n)
* Bootstrap 4

## Getting started

* Dependency
  - Docker
  - Docker Compose
* Git clone 
> git clone https://github.com/jorgemtoledo/webapp.git

* To build the containers:
>    $ sudo docker-compose 

* Install yarn:
>    $ sudo docker-compose  run --rm app yarn install --check-files

* To create the bank and do as migrations:
>    $ sudo docker-compose run --rm app bundle exec rake db:create db:migrate db:seed

* To install as gens:
>    $ sudo docker-compose run --rm app bundle install

* To run the project:
>    $ sudo docker-compose up

## Features

The main features of the app are;

* User registration 
* Control the hours worked by interns 

## Note

The seed will populate the database

* Admin users
  - login: mariazinha@gmail.com
  - password: 123456

  - login: tiopatinha@gmail.com
  - password: 123456

* Trainee users

  - login: zezinho@gmail.com
  - password: 123456

  - login: huguinho@gmail.com
  - password: 123456

  - login: luizinho@gmail.com
  - password: 123456

  - login: zepequeno@gmail.com
  - password: 123456

Sorry i didn't have time to do unit tests

## Author

* **Jorge Toledo**
