require 'spec_helper'
require 'fakefs'

module Bookmarkeron
  describe "CLI" do
    it "writes new stuff into the target file" do
      FileUtils.cp fixtures("chrome"), fixtures("cli_test")

      CLI.run(fixtures("example.yml"), fixtures("cli_test"))
      json = JSON.load(File.read(fixtures("cli_test")))

      json["roots"]["bookmark_bar"]["children"].size.should == 2

      FileUtils.rm fixtures("cli_test")
      File.exist?(fixtures("cli_test")).should be_false
    end

  xdescribe "with the -p option" do
    it "updates the profile indicated"
    end

  describe "with no target" do
    before do
      # make fake files
    end

    it "finds all Bookmark files in the chrome directory and runs on those" do
      CLI.run(fixtures("example.yml"))

      # use this:find ~/Library/Application\ Support/Google/Chrome -name Bookmarks
    end
   end
  end
end
