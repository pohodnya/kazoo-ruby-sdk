# Kazoo::Ruby::Sdk

SDK for Kazoo API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kazoo-ruby-sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kazoo-ruby-sdk

## Config

Create config/initializers/kazoo_ruby_sdk.rb
```ruby
KazooRubySdk.configure do |config|
  config.auth_url = 'http://yourserver.com:8000/v1'
  config.realm = 'your-realm'
  config.username = 'your-username'
  config.password = 'your-password'
end
```

## Usage
```ruby
devices = KazooRubySdk::Devices.new.list.data        
device_id = devices[0].id    
device = KazooRubySdk::Devices.get(device_id)
```

By default each method of this SDK will be use the configuration from initializer. 
Also you can explicitly specify a configuration before calling any method.

```ruby
configuration = {
  auth_url: 'http://your_other_server.com:8000/v1',
  realm: 'your-other-realm',
  username: 'your-other-username',
  password: 'your-other-password'
}
devices = KazooRubySdk::Devices.new(configuration).list.data        
```
 
## List of methods

#### Callflows
* list()
* get(id)
* create(attributes)
* update(id, attributes)
* destroy(id)

#### CDRs
* range(from, to)
* get(cdr_id)
* get_all_by_user(user_id)

#### Devices
* list()
* get(device_id)
* get_statuses
* create(attributes)
* update(id, attributes)
* destroy(id)

#### Phone Numbers
* create(phone_number, account_id, data)
* butch_create(phone_numbers, account_id)
* destroy(phone_number, account_id)

#### Users
* list()
* get(id)
* create(attributes)
* update(id, attributes)
* destroy(id)


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pohodnya/kazoo-ruby-sdk.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

