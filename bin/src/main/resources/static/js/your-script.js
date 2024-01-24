document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale: 'en', // 語言設定，可根據需求更改
      selectable: true,
      select: function(info) {
        alert('Selected ' + info.startStr + ' to ' + info.endStr);
        // 在此處可進行預訂或其他相關操作
      },
      events: [
        {
          title: 'Reserved',
          start: '2023-12-10', // 已預訂日期示例
          end: '2023-12-12'
        },
        // 可以添加更多已預訂日期的事件
      ]
    });
  
    calendar.render();
  });
  