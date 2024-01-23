# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Rails comands:

# Generate Scaffold
rails g scaffold Kind description:string

# Create new migration
rails g migration add_kind_to_contact kind:references

# Send migration
rails db:migrate

# Recreate DB
    1 - rails db:drop:all or rails db:drop:_unsafe
    2 - rails db:create:all
    3 - rails db:migrate

# Run Server
rails s

# Populate DB
rails dev:setup (setup or other)

# Install dependencies after add new gem
bundle