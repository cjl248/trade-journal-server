## SavvyTradeJournal (server)

### Requirements

- Postgresql version 14.x

- Ruby version 3.4.1

- Rails version 7.2.x

### Setup

- To setup the database run either of these two commands: `bin/rails db:create db:migrate db:seed` OR `bin/rails db:setup`

### Running the server

- Run the Rails server with `bin/rails s`

### Running tests

- Run the test suite with `bundle exec rspec`

### Case against resolvers in a simple app:

First, ask yourself …
Do you really need a Resolver? Putting logic in a Resolver has some downsides:

Since it’s coupled to GraphQL, it’s harder to test than a plain ol’ Ruby object in your app
Since the base class comes from GraphQL-Ruby, it’s subject to upstream changes which may require updates in your code

https://graphql-ruby.org/fields/resolvers.html#first-ask-yourself-
