require 'rspec'
require 'rspec/mocks'
require 'bookmarkeron'
require 'awesome_print'

def fixtures(filename)
  File.join(File.dirname(__FILE__), "fixtures", filename)
end

