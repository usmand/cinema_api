Configuration
-------------
Please create `.env` from `.env.template` and put correct `OMDB_API_KEY`.

Installation
------------

* `bundle install`
* `bundle exec rails db:create`
* `bundle exec rails db:migrate`
* `bundle exec rails db:seed`
* `bundle exec rails server`

Generate swagger docs
----------
`RAILS_ENV=test rake rswag:specs:swaggerize`

API docs url: `http://localhost:3000/api-docs/index.html`

Test users
----------
- Owner
email: owner@example.com
password: password

- Customer1
email: customer1@example.com
password: password

- Customer2
email: customer2@example.com
password: password

Tests(Rspec)
----------
`rspec`
