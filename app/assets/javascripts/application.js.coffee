#= require jquery
#= require jquery.ui.datepicker
#= require jquery.ui.slider
#= require jquery-ui-timepicker-addon
#= require jquery-ui-timepicker-zh-CN
#= require jquery_ujs
#= require bootstrap.min
#= require rails-timeago
#= require rails-timeago-all
#= require nprogress
#= require turbolinks
#= require_tree .

$(document).on 'page:fetch', ->
  NProgress.start()
$(document).on 'page:restore', ->
  NProgress.remove()
$(document).on 'page:change', ->
  NProgress.done()
