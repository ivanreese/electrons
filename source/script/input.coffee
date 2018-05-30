mousemove = (e)->
  hasMoved = true
  mouseX = e.clientX/zoom
  mouseY = e.clientY/zoom

touchmove = (e)->
  e.preventDefault()
  hasMoved = true
  mouseX = e.touches[0].clientX/zoom
  mouseY = e.touches[0].clientY/zoom
