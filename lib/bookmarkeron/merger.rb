require 'json'
require 'yaml'

module Bookmarkeron
  CHROME_BOOKMARKS_PATH = File.join(ENV["HOME"], "Library/Application Support/Google/Chrome/Default/Bookmarks")

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
      puts bookmarks_from_target
      bookmarks = bookmarks_from_target["roots"]["bookmark_bar"]["children"]
      bookmark_next_id = bookmarks_from_source.size
      bookmarks_from_source.each do |bookmark|
        next if bookmarks.find {|existing| existing["url"] == bookmark["url"]}
        bookmarks << bookmark.merge({
          "type"=> "url",
          "date" => "13010285566708500",
          "id" => bookmark_next_id
        })

        bookmark_next_id = bookmark_next_id + 1
      end
      bookmarks_from_target
    end

    def result_json
      JSON.pretty_generate result
    end

    def bookmarks_from_target
      @target_json ||= JSON.parse(File.read(@target))
    end
  end
end
