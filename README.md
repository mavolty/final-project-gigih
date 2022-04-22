# Generasi GIGIH Final Project Backend: Simple Ecommerce API
![](https://github.com/mavolty/final-project-gigih/blob/main/app/assets/images/generasi-gigih.png)
This repo contains code for generasi GIGIH Final Project in the Backend track. The problem for this project is to make an API for simple ecommerce. Like other ecommerce app, admin can create new menu with categories, also customers can order the menu and many details for the API you can see in the API documentation.

## Rails on Replit

This is a template to get you started with Rails on Replit. It's ready to go so you can just hit run and start coding!

This template was generated using `rails new` (after you install the `rails` gem from the packager sidebar) so you can always do that if you prefer to set it up from scratch. The only had two make config changes we had to make to run it on Replit:

- bind the app on `0.0.0.0` instead of `localhost` (see `.replit`)
- allow `*.repl.co` hosts (see `config/environments/development.rb`)
- allow the app to be iframed on `replit.com` (see `config/application.rb`)

## Clone the repository

```shell
git clone https://github.com/mavolty/final-project-gigih.git
cd final-project-gigih
```

## Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.5.1`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.5.1
```

## Install dependencies

```sh
bundle install
```

## Migrate database
```sh
rails db:migrate
```

## Test

to run the test you can run by command below. (actually i prefer to use format document in rspec)
```sh
bundle exec rspec -fd
```
to test endpoint you can go to API documentation and import the url from there or you can import the collection from exported collection in `postman` folder.

## API Documentation

I create API documentation with postman API documentation tool. You can visit the link below to see the detail about API

[API Documentation](https://documenter.getpostman.com/view/19478600/UyrAFcwr)
