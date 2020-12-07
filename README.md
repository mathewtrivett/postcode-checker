# postcode_checker

Postcode Checker is a simple web app to help people find out if their postcode is in a support service area.

## Deployed app

Test a staging version of the app online

> https://service-area-check.herokuapp.com

Or

> Visit https://service-area-check.herokuapp.com/admin to manage service areas and postcodes.

## Pre-requisites

- **Ruby** - You will need at least version: 2.7.2, we use [RVM](https://rvm.io/) to manage different versions of Ruby.
- **Postgres** - We use Postgres for our database, install it locally on Mac OSX with [Homebrew](https://brew.sh/). Once installed you can run `brew services start postgresql`.

## Environment variables

The project uses environment variables to manage configuration variables and secrets like API keys.
Using the environment for configuration is a feature of [12 Factor Apps](https://12factor.net/).

In development we use [dotenv](https://github.com/bkeepers/dotenv) to manage environment variables on a per project basis.

1. Create a file in the root of your project with the filename `.env`
2. There is a `.env.template` file in the root of the project that has all of the keys needed for the application to run locally.
3. Copy these keys into your `.env` file and set them on your machine.

> As it is not an application secret `POSTCODE_VALIDATION_SERVICE_URI=postcodes.io`

Note: Ordinarily I would store secrets like database credentials in the environment. However to make it easier to get started I have left these configuration values hard coded.

## Getting started

1. Git clone the repo to your local machine
2. Change into the directory with `cd postcode_checker`
3. `bundle install` to install ruby dependencies.
4. `yarn install` to install frontend depenencies.
5. `rails db:create db:migrate db:seed` builds the database, runs initial migrations and seeds the database
6. To run the app use a process manager like [hivemind](https://github.com/DarthSim/hivemind) to run the app locally from the development Procfile `hivemind Procfile.dev`. This mirrors how the app will run in production on Heroku.

> Note: If you don't have Hivemind installed you can alternatively run `rails s` to run the rails server.

## Security

This project uses [brakeman](https://github.com/presidentbeef/brakeman) to detect potential security vulnerabilities. Run `brakeman` in the root of the project to do a security scan.

## Tests

We use [rspec](https://github.com/rspec/rspec-rails) for automated tests. Run the test suite with `bundle exec rspec` from the project root.

## Documentation

Write and find [the documentation](docs/index.md) in the `docs` directory.

### Technical decisions

This project uses Architectural Decision Records to document technical decisions.

> Read the [technical decisions](docs/technical_decisions/README.md)

## Contributing

### Style guide

#### Ruby

The project uses [rubocop](https://github.com/rubocop-hq/rubocop) to maintain code style and format consistency. It uses the following rubocop extensions:

- [rubocop-rails](https://github.com/rubocop-hq/rubocop-rails)
- [rubocop-rspec](https://github.com/rubocop-hq/rubocop-rspec)
- [rubocop-performance](https://github.com/rubocop-hq/rubocop-performance)

> Run `rubocop` from the project root to lint the code
