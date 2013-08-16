# Bookmarkeron

Sometimes it's helpful to have project-specific bookmarks when you're developing a web application. For example:

documentation
a javascript snippet to log in as a test user
your jasmine server
your CI server

but it's kind of a pain to version control shortcuts directly. Bookmarkeron lets you declare bookmarks as yaml:

bookmarks:
  -
    url: "http://www.google.com"
    name: "cheese"
  -
    url: "http://www.instapaper.com/u"
    name: "schnoodle"

...which you can then merge into your Chrome bookmarks like so:

    bkmk bookmarks.yml

this massages the .json file Chrome uses to store your bookmarks. It merges the bookmarks from the .yml file into your chrome bookmarks.

It is meant to be idempotent; you can run it multiple times; it will not add a bookmark if it finds an existing bookmark with the same url.

It works on my machine.

## Installation

Add this line to your application's Gemfile:

    gem 'bookmarkeron'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bookmarkeron

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
