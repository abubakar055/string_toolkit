# frozen_string_literal: true

require_relative "string_toolkit/version"

module StringToolkit
  class Error < StandardError; end

  # Converts a string into a URL-friendly slug.
  #
  # @param str [String] the input string
  # @return [String] the slugified string
  #
  # @example
  #   StringToolkit.slugify("Hello World!") #=> "hello-world"
  #   StringToolkit.slugify("Ruby on Rails 101") #=> "ruby-on-rails-101"
  #
  def self.slugify(str)
    str.downcase
       .gsub(/[^a-z0-9\s-]/, "")   # Remove non-alphanumeric chars (except spaces and hyphens)
       .gsub(/[\s-]+/, "-")         # Replace spaces and consecutive hyphens with single hyphen
       .gsub(/\A-|-\z/, "")         # Trim leading/trailing hyphens
  end

  # Truncates a string to a given number of words.
  #
  # @param str [String] the input string
  # @param count [Integer] the number of words to keep
  # @param omission [String] the string to append when truncated (default: "...")
  # @return [String] the truncated string
  #
  # @example
  #   StringToolkit.truncate_words("The quick brown fox jumps over the lazy dog", 4)
  #   #=> "The quick brown fox..."
  #
  def self.truncate_words(str, count, omission: "...")
    words = str.split
    return str if words.length <= count

    words.first(count).join(" ") + omission
  end

  # Masks an email address for privacy, showing only the first and last chars.
  #
  # @param email [String] the email address to mask
  # @return [String] the masked email
  #
  # @example
  #   StringToolkit.mask_email("shoaib@example.com") #=> "s****b@example.com"
  #
  def self.mask_email(email)
    local, domain = email.split("@")
    raise Error, "Invalid email format" if local.nil? || domain.nil?

    if local.length <= 2
      masked_local = local[0] + ("*" * (local.length - 1))
    else
      masked_local = local[0] + ("*" * (local.length - 2)) + local[-1]
    end

    "#{masked_local}@#{domain}"
  end

  # Converts a string to title case (each word capitalized).
  #
  # @param str [String] the input string
  # @return [String] the title-cased string
  #
  # @example
  #   StringToolkit.title_case("hello world from ruby") #=> "Hello World From Ruby"
  #
  def self.title_case(str)
    str.split.map(&:capitalize).join(" ")
  end

  # Converts a string to snake_case.
  #
  # @param str [String] the input string
  # @return [String] the snake_cased string
  #
  # @example
  #   StringToolkit.to_snake_case("HelloWorld") #=> "hello_world"
  #   StringToolkit.to_snake_case("some-text-here") #=> "some_text_here"
  #
  def self.to_snake_case(str)
    str.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
       .gsub(/([a-z\d])([A-Z])/, '\1_\2')
       .gsub(/[\s-]+/, "_")
       .downcase
  end

  # Converts a string to camelCase.
  #
  # @param str [String] the input string
  # @return [String] the camelCased string
  #
  # @example
  #   StringToolkit.to_camel_case("hello_world") #=> "helloWorld"
  #   StringToolkit.to_camel_case("some-text-here") #=> "someTextHere"
  #
  def self.to_camel_case(str)
    parts = str.split(/[\s_-]+/)
    return str if parts.empty?

    parts.first.downcase + parts[1..].map(&:capitalize).join
  end

  # Removes all extra whitespace, leaving only single spaces.
  #
  # @param str [String] the input string
  # @return [String] the squeezed string
  #
  # @example
  #   StringToolkit.squeeze("Hello    world   from   Ruby") #=> "Hello world from Ruby"
  #
  def self.squeeze(str)
    str.strip.gsub(/\s+/, " ")
  end
end
