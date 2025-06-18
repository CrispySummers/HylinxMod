possibleNamePrefixes = {
  "Stu",
  "Xti",
  "Vas",
  "Kal"
}

possibleNameSuffixes = {
  "Aleph",
  "Beta",
  "Theta",
  "Omega",
  "Za"
}

globalPossibleConsonants = {"b", "c", "d", "f", "g", "h", "j", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"}
globalPossibleVowels = {"a", "e", "i", "o", "u"}

function generateRandomWord(wordLength, possibleConsonants, possibleVowels, seed)
  local randomWordClusters = {}

  for i = 1, wordLength, 1 do
    math.randomseed(i * seed)
    table.insert(randomWordClusters, possibleConsonants[math.random(1, #possibleConsonants)])

    if math.random() < 0.5 then
      table.insert(randomWordClusters, possibleConsonants[math.random(1, #possibleConsonants)])
    end

    table.insert(randomWordClusters, possibleVowels[math.random(1, #possibleVowels)])
  end

  local resultWord = table.concat(randomWordClusters)

  return resultWord;
end

function generateRandomSystemName(possibleNamePrefixes, possibleNameSuffixes, possibleConsonants, possibleVowels, seed)
  math.randomseed(seed)

  local prefix = ""
  if math.random() < 0.5 then
    prefix = possibleNamePrefixes[math.random(1, #possibleNamePrefixes)]
  else
    prefix = generateRandomWord(2, possibleConsonants, possibleVowels, seed * math.random(0, 10))
  end

  local suffix = ""
  if math.random() < 0.5 then
    suffix = possibleNameSuffixes[math.random(1, #possibleNameSuffixes)]
  else
    suffix = generateRandomWord(2, possibleConsonants, possibleVowels, seed * math.random(0, 10))
  end

  return prefix .. " " .. suffix
end

for i = 1, 72, 1 do
  print(generateRandomSystemName(possibleNamePrefixes, possibleNameSuffixes, globalPossibleConsonants, globalPossibleVowels, os.time() * i))
end
