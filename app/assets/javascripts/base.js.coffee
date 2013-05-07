$(document).ready ->
  $('.flashClose').click (ev) ->
    tgt = ev.target
    tgtContainer = $(tgt).data('tgtcontainer')
    $("##{tgtContainer}").hide()
