document.addEventListener('DOMContentLoaded',
    function () {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            events: [
                {
                    title: 'Event1',
                    start: '2021-11-30'
                },
                {
                    title: 'Event2',
                    start: '2021-11-29'
                }
            ],
            themeSystem: 'bootstrap',
            locale: 'nl',
            initialView: 'dayGridMonth',
            initialDate: '2021-12-14',
            headerToolbar: {
                center: 'title',
                left: 'prev,next today',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            // customButtons: {
            //     addEventButton: {
            //         text: 'add event...',
            //         click: function() {
            //             var dateStr = prompt('Enter a date in YYYY-MM-DD format');
            //             let dateStart = '2021-11-30T12:00:00',
            //                 dateEnd = '2021-11-30T13:00:00';
            //             //var date = new Date(dateStr + 'T00:00:00'); // will be in local time
            //
            //             if (!isNaN(date.valueOf())) { // valid?
            //                 calendar.addEvent({
            //                     title: 'dynamic event',
            //                     start: dateStart,
            //                     end: dateEnd,
            //                     allDay: true
            //                 });
            //                 alert('Great. Now, update your database...');
            //             } else {
            //                 alert('Invalid date.');
            //             }
            //         }
            //     }
            // }
        });
    calendar.render();
});

