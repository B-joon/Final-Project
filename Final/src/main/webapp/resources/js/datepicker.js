$(function () {
	
	var minDate = $("#startDate").val();
	var maxDate = $("#endDate").val();

	var date = new Date();
	var year = date.getFullYear();
	var month = ('0' + (date.getMonth() + 1)).slice(-2);
	var day = ('0' + date.getDate()).slice(-2);

	var today = year + '-' + month  + '-' + day;

	if (today > minDate) {
		minDate = today;
	}
	
  $('#datetimepicker').datetimepicker({
     inline: true,
     sideBySide: true,
     format: 'L',
     locale: 'ko',
     minDate: minDate,
     maxDate: maxDate,
     buttons: {
    	 showToday: true,
    	 showClear: true,
     },
     tooltips: {
    	    today: '오늘 날짜 선택',
    	    clear: '날짜 선택 제거',
    	    close: 'Close the picker',
    	    selectMonth: '월 선택',
    	    prevMonth: '이전 월',
    	    nextMonth: '다음 월',
    	    selectYear: '년도 선택',
    	    prevYear: '이전 년도',
    	    nextYear: '다음 년도',
    	    selectDecade: 'Select Decade',
    	    prevDecade: 'Previous Decade',
    	    nextDecade: 'Next Decade',
    	    prevCentury: 'Previous Century',
    	    nextCentury: 'Next Century',
    	    incrementHour: 'Increment Hour',
    	    pickHour: 'Pick Hour',
    	    decrementHour:'Decrement Hour',
    	    incrementMinute: 'Increment Minute',
    	    pickMinute: 'Pick Minute',
    	    decrementMinute:'Decrement Minute',
    	    incrementSecond: 'Increment Second',
    	    pickSecond: 'Pick Second',
    	    decrementSecond:'Decrement Second'
     },
     icons: {
    	 time: 'fas fa-clock',
         date: 'fas fa-calendar-alt',
         up: 'fas fa-arrow-up',
         down: 'fas fa-arrow-down',
         previous: 'fas fa-chevron-left',
         next: 'fas fa-chevron-right',
         today: 'fas fa-calendar-check',
         clear: 'fas fa-trash-alt',
         close: 'fas fa-times'
     }
   });
});