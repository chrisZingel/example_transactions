jQuery ->
  remove_class_active = () ->
    $('.bs-docs-sidenav li').removeClass("active")
  $('.bs-docs-sidenav li').bind("click", ->
    remove_class_active()
    $(this).addClass("active")
  )
