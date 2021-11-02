def ccipher(string, f)

string_array = string.split("")
num_array = string_array.map(&:ord)

num_array.each_with_index do |c, i|
  # Capital letter case
  if c >= 65 && c <= 90
    c += f
    if c > 90 # loop around
      c -= 26
    end
  # Small letter case
  elsif c >= 97 && c <= 122
    c += f
    if c > 122 # loop around
      c -= 26
    end
  end
  num_array[i] = c
end
new_string = num_array.map(&:chr).join("")
return new_string
end


s1 = "What a string!"

puts ccipher(s1, 5)
