# ArrayOfHashSimpleDb

[![Build Status](https://travis-ci.org/Jun0kada/array_of_hash_simple_db.svg?branch=master)](https://travis-ci.org/Jun0kada/array_of_hash_simple_db)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'array_of_hash_simple_db'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install array_of_hash_simple_db

## Usage

```ruby
class User
  include ArrayOfHashSimpleDb

  self.records = [
    { name: 'Jun' },
    { name: 'John' },
    { name: 'Jun', age: 20 },
  ]
end

user = User.first
# => #<User:0x00007ffcd9aa9190 @attributes={:name=>"Jun"}>
user.name
# => "Jun"
user.age
# => nil
user = User.last
# => #<User:0x00007ffcd9aa8ba0 @attributes={:name=>"Jun", :age=>20}>
user.name
# => "Jun"
user.age
# => 20
user = User.find_by(name: 'John')
# => #<User:0x00007ffcd9aa8e70 @attributes={:name=>"John"}>
user.name
# => "John"
user.age
# => nil
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/array_of_hash_simple_db. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ArrayOfHashSimpleDb project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/array_of_hash_simple_db/blob/master/CODE_OF_CONDUCT.md).
