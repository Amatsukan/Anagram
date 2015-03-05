json.array!(@anagrams) do |anagram|
  json.extract! anagram, :id, :w1, :w2, :result
  json.url anagram_url(anagram, format: :json)
end
