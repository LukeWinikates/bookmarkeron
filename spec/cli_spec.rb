require 'spec_helper'

module Bookmarkeron
  describe CLI do

    it "writes new stuff into the target file" do
      FileUtils.cp fixtures("chrome"), fixtures("cli_test")

      CLI.run(fixtures("example.yml"), fixtures("cli_test"))
      json = JSON.load(File.read(fixtures("cli_test")))

      json["roots"]["bookmark_bar"]["children"].size.should == 2

      FileUtils.rm fixtures("cli_test")
      File.exist?(fixtures("cli_test")).should be_false
    end

    describe "with no target" do
      it "finds all Bookmark files in the chrome directory and runs on those" do
        fake_merger = double(:merger, allow: true)
        Finder.should_receive(:find).and_return(["a", "b"])
        Merger.should_receive(:new).with(hash_including(target: "a")).and_return(fake_merger)
        Merger.should_receive(:new).with(hash_including(target: "b")).and_return(fake_merger)
        fake_merger.should_receive(:result_json).twice
        File.should_receive(:write).twice

        CLI.run(fixtures("example.yml"))

        # use this:find ~/Library/Application\ Support/Google/Chrome -name Bookmarks
      end
    end
  end
end
