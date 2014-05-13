# Rmoolah

TODO: Write a gem description

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

## Contributing

1. Fork it ( https://github.com/egze/rmoolah/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
