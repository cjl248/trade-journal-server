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

Case against resolvers in a simple app

First, ask yourself …
Do you really need a Resolver? Putting logic in a Resolver has some downsides:

Since it’s coupled to GraphQL, it’s harder to test than a plain ol’ Ruby object in your app
Since the base class comes from GraphQL-Ruby, it’s subject to upstream changes which may require updates in your code
https://graphql-ruby.org/fields/resolvers.html#first-ask-yourself-








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