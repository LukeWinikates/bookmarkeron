require 'spec_helper'

module Bookmarkeron
  describe Finder do
    include FakeFS::SpecHelpers

    xit "finds all the Bookmark files on the file system" do
      root = File.join(ENV["HOME"], "Library", "Application Support", "Chrome")
      profiles = ["A", "Bee", "see"]
      bookmark_files = []

      profiles.map do |p|
        FileUtils.mkdir_p File.join(root, p)
        bookmark_file = File.join(root, p, 'Bookmarks')
        bookmark_files << bookmark_file
        nonsense_file = File.join(root, p, 'Sandwich')
        FileUtils.touch bookmark_file
        FileUtils.touch nonsense_file
      end

      Finder.find.should == bookmark_files
    end
  end
end
