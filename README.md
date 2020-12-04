# postcode_checker

Add a description for your project here

## Pre-requisites

- **Ruby** - You will need at least version: 2.7.2, we use [RVM](https://rvm.io/) to manage different versions of Ruby.
- **Postgres** - We use Postgres for our database, install it locally on Mac OSX with [Homebrew](https://brew.sh/). Once installed you can run `brew services start postgresql`.
- **Redis** - Install a redis server locally with `brew install redis` and then run `brew services start redis` to get it up and running.

## Getting started

1. Git clone the repo to your local machine
2. Change into the directory with `cd postcode_checker`
3. `bundle install` to install ruby dependencies.
4. `yarn install` to install frontend depenencies.
5. `db:create && db:migrate && db:seed` builds the database, runs initial migrations and seeds the database
6. To run the app use a process manager like [hivemind](https://github.com/DarthSim/hivemind) to run the app locally from the development Procfile `hivemind Procfile.dev`. This mirrors how the app will run in production on Heroku.

## Security

This project uses [brakeman](https://github.com/presidentbeef/brakeman) to detect potential security vulnerabilities. Run `brakeman` in the root of the project to do a security scan. 

## Tests

We use [rspec](https://github.com/rspec/rspec-rails) for automated tests. Run the test suite with `bundle exec rspec` from the project root.

## Documentation

> Don't document the program; program the document. -- unknown

Documentation is important for your hygiene. 

Write and find [the documentation](docs/index.md) in the `docs` directory.

### Technical decisions

This project uses Architectural Decision Records to document technical decisions.

> Read the [architectural decisions](docs/adr/README.md)

## Deployment


## Contributing


### Style guide

#### Ruby

The project uses [rubocop](https://github.com/rubocop-hq/rubocop) to maintain code style and format consistency. It uses the following rubocop extensions:

- [rubocop-rails](https://github.com/rubocop-hq/rubocop-rails)
- [rubocop-rspec](https://github.com/rubocop-hq/rubocop-rspec)
- [rubocop-performance](https://github.com/rubocop-hq/rubocop-performance)

#### SCSS


#### JavaScript