class Stack

    def initialize
        @stack = []             # implementation of our Stack will be an array.
    end

    def push(el)
        @stack.push(el)
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[-1]
    end

end

=begin
DFS:
base case:

def dfs(root, target)
    return nil if root == nil
    return root if root == target

    dfs(child, target)
end

=end



# private - # can't access below methods outside of the class


# class "Stack" or class "Car" is the idea, or the ADT
# and in the initialize

    

s1 = Stack.new