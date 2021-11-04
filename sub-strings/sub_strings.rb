def sub_strings(word, dict)
    subs = Hash.new(0)
    # for each word in the dictionary, loop over given word and count
    # how many times substring was found
    dict.each do |sub|
        # scan returns an array containing all instances of a pattern
        # found in a string
        n_occurences = word.scan(sub).length
        subs[sub] = n_occurences if n_occurences > 0
    end
    return subs
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p sub_strings("below", dictionary)
p sub_strings("Howdy partner, sit down! How's it going?", dictionary)