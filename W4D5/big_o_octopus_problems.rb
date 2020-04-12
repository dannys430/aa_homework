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
# def dominant_octopus(arr, &prc)
#     prc ||= Proc.new {|a, b| a.length <=> b.length}

#     return arr if arr.length < 2

#     mid = arr.length / 2    # 4
#     left = arr[0...mid]         # ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 

#     right = arr[mid..-1]        #                                           'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#     sorted_left = dominant_octopus(left, &prc)
#     sorted_right = dominant_octopus(right, &prc)

#     merge(sorted_left, sorted_right, &prc)
    
# end

# def merge(left, right, &prc)
#     merged = []
#     until left.empty? || right.empty?
#         if prc.call(left.first, right.first) == -1
#             merged << left.shift
#         elsif prc.call(left.first, right.first) != -1
#             merged << right.shift
#         end
#     end

#     merged + left + right
# end

# p dominant_octopus(fishes)[-1]


# clever octopus - O(n) time
# def clever(arr)
#     longest = ""

#     arr.each do |fish|
#         longest = fish if fish.length > longest.length
#     end

#     longest
# end

# p clever(fishes)


# DANCING OCTOPUS
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# #slow dance - O(n)
# def slow(direction, array)
#     array.each_with_index do |dir, idx|
#         if dir == direction
#             return idx
#         end
#     end
#     nil
# end

# p slow("left-up", tiles_array)

# #constant dance
# def constant(direction, array)
#     array.index(direction)
# end

# p constant("left-up", tiles_array)


