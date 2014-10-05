define [
  "backbone"
  "backbone.marionette"
], (Backbone) ->
  "use strict"
  Communicator = Backbone.Marionette.Controller.extend(initialize: (options) ->
    
    # create a pub sub
    @mediator = new Backbone.Wreqr.EventAggregator()
    
    #create a req/res
    @reqres = new Backbone.Wreqr.RequestResponse()
    
    # create commands
    @command = new Backbone.Wreqr.Commands()
    return
  )
  new Communicator()