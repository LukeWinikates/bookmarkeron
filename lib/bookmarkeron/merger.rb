require 'json'
require 'yaml'

module Bookmarkeron
  CHROME_BOOKMARKS_PATH = ""

  class Merger
    attr_reader :target

    def initialize(opts = {})
      @target = opts[:target] || CHROME_BOOKMARKS_PATH
      @source = opts[:source]
    end

    def bookmarks_from_source
      yaml = YAML.load_file @source
      yaml["bookmarks"]
    end

    def result
      bookmarks = bookmarks_from_target["roots"]["bookmark_bar"]["children"]
      bookmarks_from_source.each do |bookmark|
        next if bookmarks.find {|existing| existing["url"] == bookmark["url"]}
        bookmarks << bookmark
      end
      bookmarks_from_target
    end

    def bookmarks_from_target
      @target_json ||= JSON.parse(File.read(@target))
    end
  end
end
