class LRUCache

    def initialize(n)
        @size = n
        @cache = []
    end

    def count
        @cache.count
    end

    def add(el)
        # if cache is below cap and cache doesn't include el
        if @cache.count < @size 
            if !@cache.include?(el)
                # add el to the end
                @cache.push(el)
            else
                @cache.delete(el)
                @cache.push(el)
            end
        else
            if !@cache.include?(el)
                @cache.shift
                @cache.push(el)
            else
                @cache.delete(el)
                @cache.push(el)
            end
        end
    end

    def show
        p @cache
    end
    
end


lru1 = LRUCache.new(4)

lru1.add("first")
lru1.add("second")
lru1.add("third")
lru1.add("fourth")
lru1.add("fourth")
lru1.add("fourth")
lru1.add("second")
lru1.add("yellow")

lru1.show

