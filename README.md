# Rmoolah

[![Build Status](https://travis-ci.org/egze/rmoolah.svg?branch=master)](https://travis-ci.org/egze/rmoolah)

With moolah.io you can process payments in-store and online. Rmoolah is a API wrapper for moolah.io

Developed by [@egze] for [9flats.com]


## Installation

Add this line to your application's Gemfile:

    gem 'rmoolah'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rmoolah

## Usage

##### Create a new transaction

```ruby
transaction = Rmoolah::Transaction.new("your_guid", 50, "USD", "My Product", "https://myamazingshop.com/success", "https://myamazingshop.com/payments/callback").create

transaction.url
=> "https://moolah.io/api/tx/322fabc5-1111-1111-1111-688eb8271204"

transaction.amount_to_pay
=> 2000

transaction.currency_to_pay
=> "DOGE"
```

##### Fetch a transaction to check payment status

```ruby
transaction = Rmoolah::Transaction.fetch("322fabc5-1111-1111-1111-688eb8271204")

transaction.status
=> "pending"
```

Look at tests for further examples.

## Contributing

1. Fork it ( https://github.com/egze/rmoolah/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request



[@egze]:http://www.github.com/egze/
[9flats.com]:http://www.9flats.com/
