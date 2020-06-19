require_relative 'ui'
def askAValidGuess (guesses, errors)
    guessHeader guesses, errors
    loop do
        guess = askGuess guesses, errors
        if guesses.include? guess
            warningDoneGuess guess            
        else
            return guess
        end
    end
end
def play(name)
    secretWord = chooseSecretWord
    errors = 0
    guesses = []
    score = 0

    while errors < 5
        guess = askAValidGuess guesses, errors
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
end

def hangman
    name = welcome
    loop do 
        play name
        if playAgain?
            break
        end
    end
end
