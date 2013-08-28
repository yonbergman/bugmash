$(document).on('click', (ev) ->
  el = $(ev.target)
  el = el.parent() if el.parent().hasClass('tweet')
  console.log(1)
  if el.hasClass('tweet')
    ev.preventDefault()
    window.open(el.attr('href'),'Victory Tweet','width=550,height=420')
)