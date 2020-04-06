class GraphNode

    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end
        #       a               e
    def bfs(starting_node, target_value)
        queue = starting_node.neighbors       # [c, e]
        until queue.empty?
            node = queue.shift                # b
            return node if node.value == target_value
        end
        nil
    end

end


# a = GraphNode.new("a")
# b = GraphNode.new("b")
# c = GraphNode.new("c")
# d = GraphNode.new("d")
# e = GraphNode.new("e")
# f = GraphNode.new("f")
# a.neighbors = [b, c, e]
# c.neighbors = [b, d]
# e.neighbors = [a]
# f.neighbors = [e]


