# O(n^2) sluggish octopus

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# def sluggish_octopus(arr)
#     longest = arr.first

#     arr.each do |fish|
#         arr.each do |fish|
#             if fish.length > longest.length
#                 longest = fish
#             end
#         end
#     end

#     longest
# end

# p sluggish_octopus(fishes)


# O(n * log(n)) dominant octopus

def dominant_octopus(arr, &prc)
    prc ||= Proc.new {|a, b| a.length <=> b.length}

    return arr if arr.length < 2

    mid = arr.length / 2    # 4
    left = arr[0...mid]         # ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 

    right = arr[mid..-1]        #                                           'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

    sorted_left = dominant_octopus(left, &prc)
    sorted_right = dominant_octopus(right, &prc)

    merge(sorted_left, sorted_right, &prc)
    
end

def merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
        if prc.call(left.first, right.first) == -1
            merged << left.shift
        elsif prc.call(left.first, right.first) != -1
            merged << right.shift
        end
    end

    merged + left + right
end

p dominant_octopus(fishes)[-1]


