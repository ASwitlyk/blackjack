class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    
   @add(@deck.pop()).last()

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    #if hasAce then [score, score + 10] else [score]
    #if hasAce then decrement score and run ace(score)
    if score > 21  #score at this point if has an ace will be a 1
      #console.log 'busted'
      @trigger 'busted'
      [score]
    else
      if hasAce
        if score + 11 > 21
          [score]
        else
          [score+10]
      else
        [score]

  stand: ->
    @trigger 'stand'

  dealPlay: (playerScore)->
    #dealerScore = @scores()
    if !@at(0).get 'revealed'
      @at(0).flip()
    dealerScore = @scores()
    console.log dealerScore
    console.log playerScore
    if dealerScore[0] < 17 and dealerScore[0] < playerScore[0]
      @hit()
      @dealPlay(playerScore)
    if dealerScore[0] >= 17 and dealerScore[0] < playerScore[0]
      @hit()
      @dealPlay(playerScore)
    if dealerScore[0] >= 17 and dealerScore[0] < 21 and dealerScore[0] > playerScore[0]
      @trigger 'dealerWin'
    if dealerScore[0] > 21
      @trigger 'dealerBust'
    if dealerScore[0] is 21
      if dealerScore[0] > playerScore[0]
        @trigger 'dealerWin'
      if dealerScore[0] is playerScore[0]
        @trigger 'tie'
    if dealerScore[0] is playerScore[0]
      @trigger 'tie'









