define [
  "backbone"
  "communicator"
  "hbs!tmpl/welcome"
], (Backbone, Communicator, Welcome_tmpl) ->
  "use strict"
  welcomeTmpl = Welcome_tmpl
  App = new Backbone.Marionette.Application()
  
  # Add application regions here 
  App.addRegions {}
  
  # Add initializers here 
  App.addInitializer ->
    document.body.innerHTML = welcomeTmpl(success: "CONGRATS!")
    Communicator.mediator.trigger "APP:START"
    return

  App

