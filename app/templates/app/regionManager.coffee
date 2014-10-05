define [
  "backbone"
  "communicator"
], (Backbone, Communicator) ->
  "use strict"
  RegionManager = Backbone.Marionette.Controller.extend(
    initialize: (options) ->
      console.log "Initialize a Region Manager"
      
      # internal region manager 
      @_regionManager = new Backbone.Marionette.RegionManager()
      
      # event API 
      Communicator.reqres.setHandler "RM:addRegion", @addRegion, this
      Communicator.reqres.setHandler "RM:removeRegion", @removeRegion, this
      Communicator.reqres.setHandler "RM:getRegion", @getRegion, this
      return

    
    # add region facade 
    addRegion: (regionName, regionId) ->
      region = @getRegion(regionName)
      if region
        console.log "REGION ALREADY CREATED TO JUST RETURN REF"
        return region
      @_regionManager.addRegion regionName, regionId

    
    # remove region facade 
    removeRegion: (regionName) ->
      @_regionManager.removeRegion regionName
      return

    
    # get region facade 
    getRegion: (regionName) ->
      @_regionManager.get regionName
  )
  new RegionManager()

