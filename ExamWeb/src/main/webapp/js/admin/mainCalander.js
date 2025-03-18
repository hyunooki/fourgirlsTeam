document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');
  let eventAll = [];  // 이벤트를 저장할 배열
  let sameDay = [];
  
  // 초기 데이터 로드
  fetch('fullData.do')
  .then(result => result.json())
  .then(function(result) {
    for (let event of result) {
      // 진한 색상 배열
      const boldColors = [
    	  "#FFB3BA",
          "#FFDFBA",
          "#FFFFBA",
          "#BAFFC9",
          "#BAE1FF",
          "#D5BAFF",
          "#FFB7D5",
          "#C2F0C2",
          "#B3E0FF", 
          "#FFD9B3" 
      ];
      
      // 랜덤으로 색상 선택
      const randomColor = boldColors[Math.floor(Math.random() * boldColors.length)];
      
      // 진한 색상 적용
      event.backgroundColor = randomColor;
      event.borderColor = randomColor;
      event.textColor = "black";
      
      // 이벤트를 eventAll 배열에 추가
      eventAll.push(event);
    }
    makeRow();
  })
  .catch(err => console.log(err));

  // 전체 캘린더 초기화 및 렌더링
  function makeRow() {
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      locale: "ko",
      dayCellContent: function(info) {
        return info.date.getDate();  // 날짜 숫자만 표시
      },
      initialDate: new Date(),
      navLinks: true, 
      selectable: true,
      selectMirror: true,
     
      editable: true,
      dayMaxEvents: true, 
      events: eventAll  
    });

    calendar.render();
  }
});