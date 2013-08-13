require 'json'
require 'yaml'

module Bookmarkeron
  class Merger
    def initialize(opts)
      @target = opts[:target]
      @source = opts[:source]
    end

    def bookmarks_from_source
      yaml = YAML.load_file @source
      yaml["bookmarks"]
    end

    def result
      bookmarks = bookmarks_from_target["roots"]["bookmark_bar"]["children"]
      bookmarks_from_source.each do |bookmark|
        bookmarks << bookmark
      end
      bookmarks_from_target
    end

    def bookmarks_from_target
      @target_json ||= JSON.parse(File.read(@target))
    end
  end
end
