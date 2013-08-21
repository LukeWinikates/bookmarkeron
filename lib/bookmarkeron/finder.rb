module Bookmarkeron
  class Finder
    class << self
      def find
        Dir.glob("#{ENV['HOME']}/Library/Application Support/Google/Chrome/**/Bookmarks")
      end
    end
  end
end
