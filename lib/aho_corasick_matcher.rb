require 'thread'

class AhoCorasickMatcher
  attr_reader :root
  private :root

  def initialize(dictionary)
    @root = Node.new

    build_trie(dictionary)
    build_suffix_map
  end

  def match(string)
    [].tap do |matches|
      string.each_char.reduce(root) do |node, char|
        (node || root).search(char.intern).tap do |child|
          matches.push(*child.matches) if child
        end
      end
    end
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
    attr_reader :matches, :child_map, :suffix, :parent
    attr_writer :suffix

    def initialize(parent = nil)
      @matches = []
      @child_map = {}
      @parent = parent
    end

    def search(char)
      @child_map[char] || suffix && suffix.search(char)
    end

    def child_or_create(char)
      @child_map[char] ||= self.class.new(self)
    end

    def children
      @child_map.values
    end

    def root?
      parent.nil?
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
  end
end
