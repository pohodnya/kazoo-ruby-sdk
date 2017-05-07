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
KazooRubySdk.auth_url = 'http://yourserver.com:8000/v1'
KazooRubySdk.realm = 'your-realm'
KazooRubySdk.username = 'your-username'
KazooRubySdk.password = 'your-password'
```

## Usage
```ruby
api = KazooRubySdk::AuthSession.new    
session = api.new_session    
devices = session.list_devices.data    
device_id = devices[0].id    
device = session.get_device(device_id)
```
 
## List of methods

#### Device
* list_devices()
* get_device(device_id)
* get_device_statuses
* create_device(name)

#### User
* list_users()
* get_user(user_id)
* create_user(attributes)
* update_user(user_id, attributes)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pohodnya/kazoo-ruby-sdk.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

