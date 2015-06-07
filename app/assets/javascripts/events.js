var event_select;

$(document).ready(function () {
  var currentYear = (new Date).getFullYear();
  var currentMonth = (new Date).getMonth() + 1;
  $(".responsive-calendar").responsiveCalendar({
    onDayClick: function(events) { 
      event_select = $(this).data("month") + "/" + $(this).data("day") +
      "/" + $(this).data("year");
      alert("taking place " + event_select);
      location.href = '../events/new?eventdate=' + event_select;
      // window.open('../events/new?eventdate=' + event_select);
    },
    // onActiveDayHover: function(events) { alert('hover yo') },
    time: currentYear + "-" + currentMonth
    // events: {
    //   "2015-06-30": {
    //     "number": 2, 
    //     "badgeClass": 
    //     "badge-warning", 
    //     "url": "http://w3widgets.com/responsive-calendar",
    //     "dayEvents": [
    //       {
    //         "name": "Important meeting",
    //         "hour": "17:30" 
    //       },
    //       {
    //         "name": "Morning meeting at coffee house",
    //         "hour": "08:15" 
    //       }
    //     ]
    //   }
    // }
  });
});