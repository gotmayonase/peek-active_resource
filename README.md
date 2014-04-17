# Peek::ActiveResource

Take a peek into the ActiveResource requests made during your app's requests.

Things this peek view provides:

- Total number of ActiveResource requests made during the request
- The duration of the AR requests made during the request

## Installation

Add this line to your application's Gemfile:

    gem 'peek-active_resource'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peek-active_resource

## Usage

Add the following to your `config/initializers/peek.rb`:

```ruby
Peek.into Peek::Views::ActiveResource
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
