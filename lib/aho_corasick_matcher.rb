require 'thread'

module AhoCorasick
  class AhoCorasickMatcher
    attr_reader :root
    private :root

    # Words need to be separated by spaces
    # e.g.: 'word1 word2 word3'
    def self.runner(new_dictionary='')
      if !new_dictionary.empty?
        @aho_corasick_runner = self.new(new_dictionary.split(" ").flatten.uniq)
        @aho_corasick_runner
      elsif @aho_corasick_runner
        @aho_corasick_runner
      else
        raise AhoCorasick::AhoCorasickMatcherError, "Dictionary can not be nil or blank."
      end
    end

    def initialize(dictionary)
      @root = Node.new

      build_trie(dictionary)
      build_suffix_map
    end

    def match(string)
      matches = []
      return matches if string.empty?

      string.each_char.reduce(root) do |node, char|
        child = (node || root).search(char.intern)
        next unless child

        matches.push(*child.matches)
        child
      end

      matches
    end

    private

    def build_trie(dictionary)
      dictionary.each do |string|
        string.each_char.reduce(root) do |node, char|
          node.child_or_create(char.intern)
        end.matches << string
      end
    end

    def build_suffix_map
      queue = Queue.new

      root.children.each do |child|
        child.suffix = root
        queue << child
      end

      until queue.empty?
        node = queue.pop
        node.children.each { |child| queue << child }
        node.build_child_suffixes
      end
    end

    class Node
      attr_reader :matches, :child_map, :parent
      attr_accessor :suffix

      def initialize(parent = nil)
        @matches = []
        @child_map = {}
        @parent = parent
      end

      def search(char)
        child_map[char] || (suffix && suffix.search(char))
      end

      def child_or_create(char)
        child_map[char] ||= self.class.new(self)
      end

      def children
        child_map.values
      end

      def root?
        !parent
      end

      def build_child_suffixes
        child_map.each do |char, child|
          failure = find_failure_node(char)
          child_suffix = failure.search(char)

          if child_suffix
            child.suffix = child_suffix
            child.matches.push(*child_suffix.matches)
          elsif failure.root?
            child.suffix = failure
          end
        end
      end

      def find_failure_node(char)
        failure = suffix
        failure = failure.suffix until failure.search(char) || failure.root?

        failure
      end

      def inspect
        format('#<%s:0x%x', self.class.name, object_id << 1)
      end
    end
  end
end
