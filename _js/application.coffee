display = true
background = document.getElementById('background')
background.onclick = ->
  prop = if display then 'none' else ''
  display = !display
  for child in document.body.children
    continue if child.tagName.toLowerCase() == 'script' || child.tagName.toLowerCase() == 'noscript' || child.id == 'background'
    child.style.display = prop
background.style.transition = background.style.webkitTransition = "all 1s ease-in-out"
background.style.transform = background.style.webkitTransform = "rotate(360deg)"
