# Slack::BlockKit

This is a helper for producing Blocks you'd expect in BlockKit.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slack-block-kit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slack-block-kit

## Usage

Require the gem using:

```ruby
require 'slack-block-kit'
```

Include the execution context DSL:

```ruby
include Slack::BlockKit::ExecutionContext
```

Then you can construct your blocks as you want:

```ruby
require 'slack-ruby-client'

client = Slack::Web::Client.new

blocks = [
  SectionBlock[text: Text[mrkdwn: "Hello, #{Bold['World!']}"]]
]

client.chat_postMessage(
  channel: '#general'
  blocks: blocks.map(&:to_h)
)
```

The current examples that Slack's BlockKit Builder provides have been reproduced under [examples](examples/).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/saraid/slack-block-kit.
