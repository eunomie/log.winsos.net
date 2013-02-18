display = true
document.getElementById('background').onclick = ->
  prop = if display then 'none' else ''
  display = !display
  for child in document.body.children
    continue if child.tagName.toLowerCase() == 'script' || child.tagName.toLowerCase() == 'noscript' || child.id == 'background'
    child.style.display = prop