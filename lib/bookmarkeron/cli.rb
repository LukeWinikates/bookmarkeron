module Bookmarkeron
  class CLI
    def self.run(source, dest = CHROME_BOOKMARKS_PATH)
      merger = Merger.new({source: source, target: dest})
      File.write(dest, merger.result_json)
    end
  end
end
