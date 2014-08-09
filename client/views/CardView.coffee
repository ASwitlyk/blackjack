class window.CardView extends Backbone.View

  className: 'card'

  #template: _.template '<%= rankName %> of <%= suitName %>'
  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png" />'
  #else _.template '<img src="img/card-back.png"/>'

  initialize: ->
    @model.on 'change', => @render
    @render()
    @model.on 

  render: ->
  	if @model.get('revealed')
  	  @$el.children().detach().end().html
  	  @$el.html @template @model.attributes
  	  @$el.addClass 'covered' unless @model.get 'revealed'
  	else
  	  @$el.children().detach().end().html
  	  @$el.html _.template('<img src="img/card-back.png />')
  	  @$el.addClass 'covered' unless @model.get 'revealed'


