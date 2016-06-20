require './testing_data.rb'

def compare_lists first_words, second_words
  index = 0
  while index < first_words.length
    p is_anagram? first_words[index], second_words[index]
    index += 1
  end
end

def is_anagram? word1, word2
  return false unless word1.length == word2.length
  hash1 = build_histogram word1
  hash2 = build_histogram word2

  hash1.each do |k,v|
    return 0 unless v == hash2[k]
  end
  1
end

def build_histogram word
  word.split('').inject(Hash.new(0)){ |h,x| h[x] +=1; h}
end

data = make_word_list
compare_lists data[:first_words], data[:second_words]
