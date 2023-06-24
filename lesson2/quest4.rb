alphabet = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
vowels= ["а","е","ё","и","о","у","ы","э","ю","я"]
vowels_hash = {}
vowels.each do |vowel|
vowels_hash[vowel] = alphabet.index(vowel) + 1
end
print vowels_hash
