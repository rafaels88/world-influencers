# Pinfluence

[![Build Status](https://travis-ci.org/rafaels88/pinfluence.svg?branch=master)](https://travis-ci.org/rafaels88/pinfluence)
[![Code Climate](https://codeclimate.com/github/rafaels88/pinfluence.png)](https://codeclimate.com/github/rafaels88/pinfluence)

[http://pinfluence.org ](http://pinfluence.org) - All world's influence in a map. Non-profit open source project.

This is an open source project for a study purpose in order to develop a real application
using mainly Ruby and Hanami, and other technologies which could fit well, like GraphQL.

You can use it as a reference for building your own project, and of course, you are welcome
to contribute on this one as well.

## Used stack and technologies

- Ruby (>= 2.4.1)
- Hanami (1.0)
- GraphQL
- Rspec (>= 3.5)
- Postgresql (>= 9.3)

## Setup

1. Make a copy of `.env.development.example` to `.env.development`;
1. Open `.env.development` and `.env.test` files and configure the `DATABASE_URL` with your local database informations

This is a Ruby project, so it is nice to have [RVM](https://rvm.io/) or [Rbenv](https://github.com/rbenv/rbenv) installed.

```bash
$ gem install bundler
$ bundle
```

After, you need to prepare your database for development and testing.

```bash
$ bundle exec hanami db prepare
$ HANAMI_ENV=test bundle exec hanami db prepare
```

Now, run the tests. If everything is fine, all tests are going to pass.

```bash
$ bundle exec rspec
```

To run server:

```bash
$ bundle exec hanami server
```

Website will be available in [http://localhost:2300](http://localhost:2300)

## Development

The project has three apps:

- WEB (`/`), which has all code to show public information, like Map;
- API (`/api`), is a public GraphQL API which `web` app makes use;
- ADMIN (`/admin`), is the dashboard. This is a restrict area.

When you run the server you run all these apps.

To create an access to admin, just create an user using `hanami console`:

```bash
$ bundle exec hanami console

CreateUser.call name: "Your Name", email: "your_email@domain.com", password: "your-plain-password"
```

And done. You now have access to local admin area.

A `Guardfile` is also available if you want to `bundle exec guard`.

## Contributing

Before it, see the [code of conduct](https://github.com/rafaels88/pinfluence/blob/master/code-of-conduct.md).

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

Copyright © 2017 Rafael Soares – Released under MIT License
