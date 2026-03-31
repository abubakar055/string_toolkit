# StringToolkit

A collection of handy string utility methods for Ruby. Provides common string transformations like slugification, truncation, email masking, case conversions, and whitespace normalization.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_toolkit'
```

And then execute:

```sh
bundle install
```

Or install it directly:

```sh
gem install string_toolkit
```

## Usage

```ruby
require 'string_toolkit'

# Convert to URL-friendly slug
StringToolkit.slugify("Hello World!")
#=> "hello-world"

# Truncate to N words
StringToolkit.truncate_words("The quick brown fox jumps over the lazy dog", 4)
#=> "The quick brown fox..."

StringToolkit.truncate_words("Long text here", 2, omission: " [read more]")
#=> "Long text [read more]"

# Mask email addresses for privacy
StringToolkit.mask_email("shoaib@example.com")
#=> "s****b@example.com"

# Title case
StringToolkit.title_case("hello world from ruby")
#=> "Hello World From Ruby"

# Convert to snake_case
StringToolkit.to_snake_case("HelloWorld")
#=> "hello_world"

# Convert to camelCase
StringToolkit.to_camel_case("hello_world")
#=> "helloWorld"

# Squeeze whitespace
StringToolkit.squeeze("Hello    world   from   Ruby")
#=> "Hello world from Ruby"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
