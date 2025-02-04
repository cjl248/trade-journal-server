# README WIP

## WIP: use notes to describe requirements, running dev and testing


<!-- 

## SavvyTradeJournal
<br>

### Notes:
`bin/rails new SavvyTradeJournal --api -d postgresql -a propshaft  -T -C -A -M --skip-hotwire --edge`

`bin/rails g resource trade symbol:string trade_type:integer quantity:integer price:decimal trade_date:datetime notes:text --routing-specs --skip-timestamps`

`bin/rails db:create db:migrate db:seed` OR `bin/rails db:setup`

Running object generator with `rails g graphql:object` (https://graphql-ruby.org/schema/generators.html) creates a type with the same name if the model exists: `rails g graphql:object trade --skip-node`









### Requirements

* Postgresql version 14.x

* Ruby version 3.4.1

* Rails version 7.2.x


### Steps to run locally

1) Configuration

2) Dev environment setup

    * To create the database, load the schema, and initialize it with the seed data run `bin/rails db:setup` 

3) Testing the code

    * To run the test suite use `bundle exec rspec` 
    
-->