# Ruboty::CanIBorrow  [![Build Status](https://travis-ci.org/rike422/ruboty-can_i_borrow.svg?branch=master)](https://travis-ci.org/rike422/ruboty-can_i_borrow)

Logging lending record and check lending status

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-can_i_borrow'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-can_i_borrow

## Usage

```ruby

@ruboty borrow to "item"
=> "itemを貸し出し状態にします。"
@ruboty borrow to "item"
=> "itemは2015-10-07に{user}さんに貸し出されています。"
@ruboty list borrowed
=> "{user}さんが、2015-10-07にitemを借りています。"
@ruboty return to "item"
=> "itemを返却済みにします。ありがとうございました。"
@ruboty list borrowed
=> "現在、誰も借りていません。"

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ruboty-can_i_borrow/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
