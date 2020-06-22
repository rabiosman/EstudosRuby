require_relative 'ui'
require_relative 'ranking'
def chooseSecretWord
    warningChoosingWord
    text = File.read("dictionary.txt")
    allWords = text.split "\n"
    chosenNumber = rand(allWords.size)
    secretWord = allWords[chosenNumber].downcase
    warningChosenWord secretWord
end

def chooseSecretWordWithLessMemory
    warningChoosingWord
    file = File.new("dictionary.txt")
    wordQuantity = file.gets.to_i
    chosenNumber = rand(wordQuantity)
    for line in 1..(chosenNumber -1)
      file.gets
    end
    secretWord = file.gets.downcase
    file.close
    warningChosenWord secretWord
end

def askAValidGuess (guesses, errors, mask)
    guessHeader guesses, errors, mask
    loop do
        guess = askGuess guesses, errors, mask
        if guesses.include? guess
            warningDoneGuess guess
        else
            return guess
        end
    end
end

def maskedWord (guesses, secretWord)
    mask = ""
    for letter in secretWord.chars
        if guesses.include? letter
            puts letter
            mask << letter
        else
            mask << "_"
        end
    end
    mask
end



def play(name)
    secretWord = chooseSecretWord
    errors = 0
    guesses = []
    score = 0

    while errors < 5
        mask = maskedWord guesses, secretWord
        guess = askAValidGuess guesses, errors, mask
        guesses << guess
        guessedALetter = guess.size == 1
        if guessedALetter
            letterSearched = guess[0]
            totalFound = secretWord.count letterSearched
        if totalFound == 0
            warningLetterNotFound
            errors += 1
        else
            warningLetterFound totalFound
        end
        else
            rightGuess = guess == secretWord
            if rightGuess
                warningRightWord
                score += 100
                break
            else
                warningWrongWord
                score -= 30
                errors += 1
            end
        end
    end
    warningScore score
    score
end

def hangman
    name = welcome
    totalScore = 0
    warningCurrentWinner readRanking
    loop do
        totalScore += play name
        warningTotalScore totalScore
        if readRanking[1].to_i < totalScore
            saveRanking name, totalScore
        end
        if playAgain?
            break
        end
    end
end
