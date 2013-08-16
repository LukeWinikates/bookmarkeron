require 'spec_helper'

def fixtures(filename)
  File.join(File.dirname(__FILE__), "fixtures", filename)
end

module Bookmarkeron

  describe Merger do

    describe "defaults" do
      its(:target) { should == CHROME_BOOKMARKS_PATH }
    end

    describe "merging urls into the Chrome bookmarks" do
      let(:result) do
        merger = Merger.new({target: fixtures("chrome"), source: fixtures("example.yml")})
        merger.result
      end

      it "merges" do
        result["roots"]["bookmark_bar"]["children"].find do |bookmark|
          bookmark["url"] == "http://www.google.com"
          bookmark["name"] == "cheese"
        end.should_not be_nil
      end

      context "when a link with the same url already exists" do
        it "does not add the new bookmark" do
          result["roots"]["bookmark_bar"]["children"].find do |bookmark|
            bookmark["url"] == "http://www.instapaper.com/u"
            bookmark["name"] == "schnoodle"
          end.should be_nil
        end
      end
    end
  end
end
