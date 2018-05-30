running = true

container = document.body
absolutePos container
setupSurface surface for name, surface of surfaces

window.addEventListener "mousemove", mousemove
window.addEventListener "touchmove", touchmove, passive: false
window.addEventListener "resize", requestResize
window.addEventListener "gesturestart", (e)-> e.preventDefault()
document.body.addEventListener "gesturestart", (e)-> e.preventDefault()

resize()
render()
