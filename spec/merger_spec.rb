require 'spec_helper'

def fixtures(filename)
  File.join(File.dirname(__FILE__), "fixtures", filename)
end

module Bookmarkeron
  describe "merging urls into the Chrome bookmarks" do
    it "merges" do
      merger = Merger.new({target: fixtures("Bookmarks"), source: fixtures("example.yml")})
      merger.result["roots"]["bookmark_bar"]["children"].find do |bookmark|
        bookmark["url"] == "http://www.google.com"
        bookmark["name"] == "cheese"
      end.should_not be_nil
    end
  end
end
