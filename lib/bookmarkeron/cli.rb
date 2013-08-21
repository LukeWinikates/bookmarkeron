module Bookmarkeron
  class CLI
    def self.run(source, destination = nil)
      if destination
        dests = [destination]
      else
        dests = Finder.find
      end
      dests.each do |dest|
        puts "merging bookmarks into #{dest}"
        merger = Merger.new({source: source, target: dest})
        File.write(dest, merger.result_json)
      end

      puts "#{dests.size} profiles updated"
    end
  end
end
