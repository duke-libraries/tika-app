# Tika::App

Ruby bindings for Tika (tika-app.jar).

Compatible with Tika 1.9.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tika-app'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tika-app

## Configuration

Set path to Tika jar file:

```ruby
Tika::App.path = "/path/to/tika-app.jar"
```

## Usage

```ruby
> resource = Tika::Resource.new("README.md")
 => #<Tika::Resource:0x007f996a04fbe0 @file="README.md", @app=#<Tika::App:0x007f996a04fb68 @path="/path/to/tika-app.jar">, @opts={}> 
> resource.metadata
 => {"Content-Encoding"=>"ISO-8859-1", "Content-Length"=>"580", "Content-Type"=>"text/plain; charset=ISO-8859-1", "X-Parsed-By"=>["org.apache.tika.parser.DefaultParser", "org.apache.tika.parser.txt.TXTParser"], "resourceName"=>"README.md"} 
> resource.language
 => "en" 
> resource.content_type
 => "text/x-web-markdown" 
> resource.text
 => "# Tika::App\n\nRuby bindings for Tika command-line API.\n\n## Installation\n\nAdd this line to your application's Gemfile:\n\n```ruby\ngem 'tika-app'\n```\n\nAnd then execute:\n\n    $ bundle\n\nOr install it yourself as:\n\n    $ gem install tika-app\n\n## Usage\n\nTODO: Write usage instructions here\n\n## Contributing\n\n1. Fork it ( https://github.com/[my-github-username]/tika-app/fork )\n2. Create your feature branch (`git checkout -b my-new-feature`)\n3. Commit your changes (`git commit -am 'Add some feature'`)\n4. Push to the branch (`git push origin my-new-feature`)\n5. Create a new Pull Request" 
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tika-app/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
