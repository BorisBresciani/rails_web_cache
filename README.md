# RailsWebCache

[![Gem Version](https://badge.fury.io/rb/rails_web_cache.svg)](https://badge.fury.io/rb/rails_web_cache)
[![Maintainability](https://api.codeclimate.com/v1/badges/5c8cfdc538a5230ab7d8/maintainability)](https://codeclimate.com/github/BorisBresciani/rails_web_cache/maintainability)
[![Build Status](https://travis-ci.org/BorisBresciani/rails_web_cache.svg?branch=master)](https://travis-ci.org/BorisBresciani/rails_web_cache)
[![security](https://hakiri.io/github/BorisBresciani/rails_web_cache/master.svg)](https://hakiri.io/github/BorisBresciani/rails_web_cache/master)
![Gem](https://img.shields.io/gem/dt/rails_web_cache)
[![Coverage Status](https://coveralls.io/repos/github/BorisBresciani/rails_web_cache/badge.svg?branch=master)](https://coveralls.io/github/BorisBresciani/rails_web_cache?branch=master)

RailsWebCache is a simple Ruby/Rails library for manage Rails cache by Web UI (Redis, Memory, etc...)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_web_cache'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_web_cache

## Usage

Add this line to the file `config/routes.rb`
```ruby
  mount RailsWebCache::Engine => '/rails_web_cache' # You can customize the path (ex: '/cache')
```

Enjoy ! Go to `/rails_web_cache`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BorisBresciani/rails_web_cache. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
