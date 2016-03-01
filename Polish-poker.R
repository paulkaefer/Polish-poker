# easier to store cards as numbers (11=Jack; 12=Queen; 13=King)
cards <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)
# repeat four times to get full deck. Add two 14s for Jokers
cards <- c(rep(cards, 4), 14, 14)

# this depends on how you play. there seem to be several different scoring systems.
pointValues <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 0)
# repeat to get the full deck. Add two values for the Jokers
pointValues <- c(rep(pointValues, 4), -3, -3)

nTrials <- 10000
scores <- c(0)

for (i in 1:nTrials) {
  
  # initially, we have a full deck:
  cardsAvailable <- cards
  pointsAvailable <- points
  
  nCards <- length(cardsAvailable)
  
  # we all start on even footing
  score <- 0
  
  for (iPair in 1:3) {
    
    firstCardIndex <- sample(1:nCards, 1)
    
    firstCardThisPair <- cardsAvailable[firstCardIndex]
    firstCardPoints <- pointsAvailable[firstCardIndex]
    
    # remove the first card from the set
    cardsAvailable <- cardsAvailable[-firstCardIndex]
    pointsAvailable <- pointsAvailable[-firstCardIndex]
    nCards <- nCards - 1
    
    secondCardIndex <- sample(1:nCards, 1)
    
    secondCardThisPair <- cardsAvailable[secondCardIndex]
    secondCardPoints <- pointsAvailable[secondCardIndex]
    
    # remove the second card from the set
    cardsAvailable <- cardsAvailable[-secondCardIndex]
    pointsAvailable <- pointsAvailable[-secondCardIndex]
    nCards <- nCards - 1
    
    # if the cards do NOT match, add their values to your total points
    if (firstCardThisPair != secondCardThisPair) {
      
      score <- score + firstCardPoints + secondCardPoints
      
    }
    
  }
  
  scores[i] <- score
  
}
