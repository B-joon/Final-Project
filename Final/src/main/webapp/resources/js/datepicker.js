$(function () {
  $('#datetimepicker').datetimepicker({
     inline: true,
     sideBySide: true,
     format: 'L',
     locale: moment.locale('ko'),
   });
});