# Baidu Cloud Push

The ruby gem of baidu cloud push base on Baidu Push Rest API 3.0

## Installation

Add this line to your application's Gemfile:

    gem 'baidu_push', :git => 'git@github.com:cinic2003/baidu_push.git

And then execute:

    $ bundle


## Usage

```ruby
api_key = 'your_api_key'
secret_key = 'your_secret_key'
# Create a client
client = BaiduPush::Client.new(api_key: api_key, secret_key: secret_key)

# Push messages
messages = { title: 'title', description: 'desc' }
client.push_msg 3, messages, 'android-test', message_type: 1
```
>For more examples refer to the [official doc](http://push.baidu.com/doc/restapi/restapi)

### Required params:
```ruby
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## From
Thanks [fahchen/baidu_push](https://github.com/fahchen/baidu_push.git)
