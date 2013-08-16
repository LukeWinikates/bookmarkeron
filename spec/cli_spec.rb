require 'spec_helper'

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
  end
end
