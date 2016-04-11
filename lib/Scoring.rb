class Scoring
  LETTER_VALUE = { "A"=> 1, "E"=> 1, "I"=> 1, "O"=> 1, "U"=> 1, "L"=> 1, "N"=> 1, "R"=> 1, "S"=> 1, "T"=> 1,
                   "D"=> 2, "G"=> 2,
                   "B"=> 3, "C"=> 3, "M"=> 3, "P"=> 3,
                   "F"=> 4, "H"=> 4, "V"=> 4, "W"=> 4, "Y"=> 4,
                   "K"=> 5,
                   "J"=> 8, "X"=> 8,
                   "Q"=> 10, "Z"=> 10
                 }

  def self.score(word)                    #this is going to find the total value of the word.... self. bc its a method of the class, not an instance (the numbers are always the same for the letters)
    total = 0                             #defining total (variable) as zero for now
    word.upcase.each_char do |key|        #turning the word into upcase and iterating through each character(letter) of the word
      total = total + LETTER_VALUE[key]   #tally the total sum of the value of those letters, when we call [key] on LETTER_VALUE it will give us the value of that key and add it to our total
    end
    word.length == 7 ? total + 50 : total #Return is implicit   #if the word's length is 7 then we add 50 to our total/ this is an ternary!!!
  end

  def self.letter_hashes(word)   # [{index: 0, letter: "L", value: 4}, {...}]
    array = []
    index_num = 0
    word.upcase.each_char do |char|
      hash = {}
      hash[:index] = index_num
      hash[:letter] = char
      hash[:value] = LETTER_VALUE[char]
      array << hash
      index_num += 1
    end
    return array
  end

  def self.multiple_word_hashes(words) # [{word: "hello", score: 45, letter_hashes: [{index: 0, letter: "H", value: 4}, {...}] }
    array = []
    words.each do |word|
      hash = {}
      hash[:word] = word
      hash[:score] = self.score(word)
      hash[:letter_hashes_array] = self.letter_hashes(word)
      array << hash
    end
    return array
  end

end
