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

Tests
----------
`rspec`
