class Scoring
  attr_reader :word1, :word1_score, :word2, :word2_score, :word3, :word3_score, :word4, :word4_score, :word5, :word5_score

  def initialize(options = {})
    @word1 = options["word1"]
    @word2 = options["word2"]
    @word3 = options["word3"]
    @word4 = options["word4"]
    @word5 = options["word5"]

    @word1_score = score(options["word1"])
    @word2_score = score(options["word2"])
    @word3_score = score(options["word3"])
    @word4_score = score(options["word4"])
    @word5_score = score(options["word5"])

  end

  LETTER_VALUE = { "A"=> 1, "E"=> 1, "I"=> 1, "O"=> 1, "U"=> 1, "L"=> 1, "N"=> 1, "R"=> 1, "S"=> 1, "T"=> 1,
                   "D"=> 2, "G"=> 2,
                   "B"=> 3, "C"=> 3, "M"=> 3, "P"=> 3,
                   "F"=> 4, "H"=> 4, "V"=> 4, "W"=> 4, "Y"=> 4,
                   "K"=> 5,
                   "J"=> 8, "X"=> 8,
                   "Q"=> 10, "Z"=> 10
                 }

  def score(word)                    #this is going to find the total value of the word.... self. bc its a method of the class, not an instance (the numbers are always the same for the letters)
    total = 0                             #defining total (variable) as zero for now
    word.upcase.each_char do |key|        #turning the word into upcase and iterating through each character(letter) of the word
      total = total + LETTER_VALUE[key]   #tally the total sum of the value of those letters, when we call [key] on LETTER_VALUE it will give us the value of that key and add it to our total
    end
    word.length == 7 ? total + 50 : total #Return is implicit   #if the word's length is 7 then we add 50 to our total/ this is an ternary!!!
  end
end
