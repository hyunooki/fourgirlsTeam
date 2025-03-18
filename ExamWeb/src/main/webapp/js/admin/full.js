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
        "#FF5733", 
        "#FF8C00", 
        "#FF4500", 
        "#FFD700", 
        "#00BFFF",
        "#20B2AA",
        "#32CD32", 
        "#1E90FF", 
        "#FF1493", 
        "#8A2BE2"  
      ];
      
      // 랜덤으로 색상 선택
      const randomColor = boldColors[Math.floor(Math.random() * boldColors.length)];
      
      // 진한 색상 적용
      event.backgroundColor = randomColor;
      event.borderColor = randomColor;
      event.textColor = "white";
      
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
        return info.date.getDate(); 
      },
      initialDate: new Date(),
      navLinks: true, 
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        Swal.fire({
          title: 'Event Title',
          input: 'text',
          inputLabel: '타이틀을 입력하세요',
          inputPlaceholder: '이벤트 제목',
          showCancelButton: true,
          confirmButtonText: '확인',
          cancelButtonText: '취소'
        }).then((result) => {
          if (result.isConfirmed && result.value.trim().length > 0) {
            const title = result.value;

            // 랜덤 색상 생성
            const boldColors = [
              "#FF5733", "#FF8C00", "#FF4500", "#FFD700", "#00BFFF", 
              "#20B2AA", "#32CD32", "#1E90FF", "#FF1493", "#8A2BE2"
            ];
            const randomColor = boldColors[Math.floor(Math.random() * boldColors.length)];

            // 데이터 저장
            fetch('insertData.do?title=' + title + '&start=' + arg.startStr + '&end=' + arg.endStr)
            .then(result => result.json())
            .then(function(result) {
              if (result.retCode == "NG") {
                Swal.fire('등록 실패', '일정을 등록하는 데 실패했습니다.', 'error');
              } else {
                Swal.fire('등록 성공', '일정이 등록되었습니다.', 'success');
              }
            });

            // 일정 추가 및 랜덤 색상 적용
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay,
              backgroundColor: randomColor,  
              borderColor: randomColor,
              textColor: "white"
            });

            calendar.unselect();
          } else {
            Swal.fire('입력 오류', '타이틀을 입력하세요.', 'warning');
          }
        });
      },
      eventClick: function(arg) {
        let title = arg.event._def.title;
        let start = arg.event.startStr;
        let end = arg.event.endStr;

        Swal.fire({
          title: '정말로 삭제하시겠습니까?',
          text: '삭제된 일정은 복구할 수 없습니다.',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonText: '삭제',
          cancelButtonText: '취소'
        }).then((result) => {
          if (result.isConfirmed) {
            fetch('deleteCal.do?title=' + title + '&start=' + start + '&end=' + end)
            .then(result => result.json())
            .then(function(result) {
              if (result.retCode == "NG") {
                Swal.fire('삭제 실패', '일정을 삭제하는 데 실패했습니다.', 'error');
              } else {
                Swal.fire('삭제 성공', '일정이 삭제되었습니다.', 'success');
                arg.event.remove();
              }
            });
          }
        });
      },
      editable: true,
      dayMaxEvents: true, 
      events: eventAll  
    });

    calendar.render();
  }
});