$(document).on 'ready page:change', -> 
  $("#activity_start_at").datetimepicker
    stepMinute: 5,
    dateFormat: 'yy-mm-dd'
