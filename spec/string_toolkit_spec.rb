# frozen_string_literal: true

RSpec.describe StringToolkit do
  it "has a version number" do
    expect(StringToolkit::VERSION).not_to be_nil
  end

  describe ".slugify" do
    it "converts a simple string to a slug" do
      expect(StringToolkit.slugify("Hello World")).to eq("hello-world")
    end

    it "removes special characters" do
      expect(StringToolkit.slugify("Hello, World! How's it going?")).to eq("hello-world-hows-it-going")
    end

    it "handles multiple spaces and hyphens" do
      expect(StringToolkit.slugify("Ruby   on---Rails")).to eq("ruby-on-rails")
    end

    it "trims leading and trailing hyphens" do
      expect(StringToolkit.slugify("--hello--")).to eq("hello")
    end

    it "keeps numbers" do
      expect(StringToolkit.slugify("Rails 101")).to eq("rails-101")
    end
  end

  describe ".truncate_words" do
    it "truncates to the given number of words" do
      result = StringToolkit.truncate_words("The quick brown fox jumps over the lazy dog", 4)
      expect(result).to eq("The quick brown fox...")
    end

    it "returns the original string if word count is within limit" do
      result = StringToolkit.truncate_words("Hello World", 5)
      expect(result).to eq("Hello World")
    end

    it "supports a custom omission string" do
      result = StringToolkit.truncate_words("One two three four five", 3, omission: " [more]")
      expect(result).to eq("One two three [more]")
    end
  end

  describe ".mask_email" do
    it "masks the local part of a standard email" do
      expect(StringToolkit.mask_email("shoaib@example.com")).to eq("s****b@example.com")
    end

    it "handles short local parts" do
      expect(StringToolkit.mask_email("ab@example.com")).to eq("a*@example.com")
    end

    it "raises an error for invalid emails" do
      expect { StringToolkit.mask_email("notanemail") }.to raise_error(StringToolkit::Error)
    end
  end

  describe ".title_case" do
    it "capitalizes each word" do
      expect(StringToolkit.title_case("hello world from ruby")).to eq("Hello World From Ruby")
    end

    it "handles single word" do
      expect(StringToolkit.title_case("ruby")).to eq("Ruby")
    end
  end

  describe ".to_snake_case" do
    it "converts CamelCase to snake_case" do
      expect(StringToolkit.to_snake_case("HelloWorld")).to eq("hello_world")
    end

    it "converts kebab-case to snake_case" do
      expect(StringToolkit.to_snake_case("some-text-here")).to eq("some_text_here")
    end

    it "converts spaces to underscores" do
      expect(StringToolkit.to_snake_case("Hello World")).to eq("hello_world")
    end

    it "handles consecutive capitals" do
      expect(StringToolkit.to_snake_case("HTMLParser")).to eq("html_parser")
    end
  end

  describe ".to_camel_case" do
    it "converts snake_case to camelCase" do
      expect(StringToolkit.to_camel_case("hello_world")).to eq("helloWorld")
    end

    it "converts kebab-case to camelCase" do
      expect(StringToolkit.to_camel_case("some-text-here")).to eq("someTextHere")
    end

    it "converts spaces to camelCase" do
      expect(StringToolkit.to_camel_case("hello world")).to eq("helloWorld")
    end
  end

  describe ".squeeze" do
    it "collapses multiple spaces" do
      expect(StringToolkit.squeeze("Hello    world   from   Ruby")).to eq("Hello world from Ruby")
    end

    it "trims leading and trailing spaces" do
      expect(StringToolkit.squeeze("  hello  ")).to eq("hello")
    end

    it "handles tabs and newlines" do
      expect(StringToolkit.squeeze("hello\t\tworld\n\nfoo")).to eq("hello world foo")
    end
  end
end
