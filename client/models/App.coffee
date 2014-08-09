#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('busted', =>
    	alert('you lose!!')
    	@set 'playerHand', deck.dealPlayer())
    @get('playerHand').on('stand', =>
    	#@set 'playerHand', deck.dealPlayer()
    	@get('dealerHand').dealPlay(@get('playerHand').scores()))
    @get('dealerHand').on('dealerBust', =>
    	alert('you win!!'))
    @get('dealerHand').on('dealerWin', =>
    	alert('you loser you loser!!!'))
    @get('dealerHand').on('tie', =>
    	alert('we tied but house always wins, pay me!!'))
    @get('dealerHand').on('reveal', =>
    	@set('revealed', true))



