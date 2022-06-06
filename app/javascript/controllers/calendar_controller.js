import { Controller } from "@hotwired/stimulus"
import Cal from 'tui-calendar';
import Rails from '@rails/ujs'

const statusColor = {
  'My Calendar': {
    id: '1',
    color: '#ffffff',
    bgColor: '#9e5fff',
    dragBgColor: '#000',
    borderColor: '#9e5fff',
  },
  'Todos': {
    id: '2',
    color: '#ffffff',
    bgColor: '#00a9ff',
    dragBgColor: '#000',
    borderColor: '#00a9ff'
  },
  'Finish': {
    id: '3',
    color: '#ffffff',
    bgColor: '#00a',
    dragBgColor: '#000',
    borderColor: '#00a'
  }
}
const calendars =  [
  {
    id: '1',
    name: 'My Calendar',
    color: '#ffffff',
    bgColor: '#9e5fff',
    dragBgColor: '#000',
    borderColor: '#9e5fff',
  },
  {
    id: '2',
    name: 'Todos',
    color: '#ffffff',  
    bgColor: '#00a9ff',
    dragBgColor: '#00a9ff',
    borderColor: '#00a9ff',
  },
  {
    id: '3',
    name: 'Done',
    color: '#ffffff',
    bgColor: '#fa0',
    dragBgColor: '#fa0',
    borderColor: '#fa0',
  },
  {
    id: '4',
    name: 'Finish',
    color: '#ffffff',
    bgColor: '#00a',
    dragBgColor: '#00a',
    borderColor: '#00a',
  },
]
export default class extends Controller {
  

  getCalendarData() {
    let url = './schedules.json'
    // let calendarsMap = new Map(Object.entries(calendars))
    // console.log(calendarsMap);
    // console.log(calendarsMap.get('name'))
    
    fetch(url)
      .then(response => response.json())
      .then(response => response.forEach(schedule => {
        this.calendar.createSchedules([
          {
            id: schedule.id,
            title: schedule.title,
            location: schedule.location,
            category: 'time',
            start: schedule.start,
            dueDateClass: schedule.dataDataClass,
            end: schedule.end,
            color: statusColor[schedule.name].color,
            bgColor: statusColor[schedule.name].bgColor,
            dragBgColor: statusColor[schedule.name].dragBgColor,
            borderColor: statusColor[schedule.name].borderColor,
          }
        ])
        // console.log(schedule.name);
        function status(e) {
          if (e.name === schedule.name) {
            return e.name
          }
        }
        console.log(calendars.find(status));

      }))
  }

  // 在日曆上新增行程
  createCalendarSchedule() {
    let calendar = this.calendar
    calendar.on('beforeCreateSchedule', (e) => {
      // console.log(e);
      // let newcalendars = calendars.filter(function (item) {
      //   return item.name == e.name
      // })
      let schedule = {
        id: 1,
        calendarId: '1',
        title: e.title,
        category: 'time',
        location: e.location,
        start: e.start,
        end: e.end,
        // name: newcalendars.name
        // name: calendars.find(c => c.name == e.name),
        // color: statusColor[schedule.name].color,
        // bgColor: statusColor[schedule.name].bgColor,
        // dragBgColor: statusColor[schedule.name].dragBgColor,
        // borderColor: statusColor[schedule.name].borderColor,
      }
      // console.log(Object.entries(calendars));
      calendar.createSchedules([schedule])
      let formData = new FormData()
      
      console.log(schedule.name);
      formData.append('[schedule]title', schedule.title)
      formData.append('[schedule]start', schedule.start._date)
      formData.append('[schedule]end', schedule.end._date)
      formData.append('[schedule]location', schedule.location)
      formData.append('[schedule]name', schedule.name)

      console.log(formData);
      console.log(schedule);

      Rails.ajax({
        type: 'post',
        url: './schedules',
        data: formData
      })
    })
  }

  // 更新行程
  updatedCalendarSchedule() {
    let calendar = this.calendar
    calendar.on('beforeUpdateSchedule', (e) => {
      let schedule = e.schedule
      let changes = e.changes
      let formUpdate = new FormData()
      if (changes.end) {
        formUpdate.append('[schedule]end', changes.end._date)
      }
      if (changes.start) {
        formUpdate.append('[schedule]start', changes.start._date)
      }
      if (changes.title) {
        formUpdate.append('[schedule]title', changes.title)
      }
      if (changes.location) {
        formUpdate.append('[schedule]location', changes.location)
      }
      calendar.updateSchedule(schedule.id, schedule.calendarId, changes, {
        start: e.startTime,
        end: e.endTime,
        title: e.title,
        location: e.location,
    });
      
      // calendar.updateSchedule([schedule])
      // let formData = new FormData()
      
      // formData.append('title', schedule.title)
      // formData.append('start', schedule.start._date)
      // formData.append('end', schedule.end._date)
      // formData.append('location', schedule.location)
      


      Rails.ajax({
        type: 'patch',
        url: './schedules/' + schedule.id,
        data: formUpdate
      })
    })
  }

  // 刪除行程
  deleteCalendarSchedule() {
    let calendar = this.calendar
    calendar.on('beforeDeleteSchedule', (e) => {
      let schedule = e.schedule
      calendar.deleteSchedule(schedule.id, schedule.calendarId)

      Rails.ajax({
        type: 'delete',
        url: './schedules/' + schedule.id,
      })
    })
  }

  


  connect() {


    
    this.calendar = new Cal(document.getElementById('calendar'), {
      id: "1",
      name: "schedule",
      defaultView: 'month',  
      scheduleView: true,  
      useCreationPopup: true,
      useDetailPopup: true,
      milestone: true,
      calendars: calendars,
      milestone: true,    // Can be also ['milestone', 'task']
        scheduleView: false,  // Can be also ['allday', 'time']
        useCreationPopup: true,
        useDetailPopup: true,
        template: {
  
          popupDetailRepeat: function(schedule) {
            return 'Repeat : ' + schedule.recurrenceRule;
          },
          popupIsAllDay: function() {
            return 'Day';
          },
  
          popupStateFree: function() {
            return ['Todos', 'Doing'] ;
          },
            milestone: function(schedule) {
                return '<span style="color:red;"><i class="fa fa-flag"></i> ' + schedule.title + '</span>';
            },
          //   milestoneTitle: function() {
          //       return 'Milestone';
          //   },
          //   task: function(schedule) {
          //       return '&nbsp;&nbsp;#' + schedule.title;
          //   },
          //   taskTitle: function() {
          //       return '<label><input type="checkbox" />Task</label>';
          // },    
        }
    })



    this.getCalendarData()
    this.createCalendarSchedule()
    this.updatedCalendarSchedule()
    this.deleteCalendarSchedule()

    changeStatus.addEventListener("change", e => {
      if (["month", "week", "day"].indexOf(e.target.value) > -1) {
        this.calendar.changeView(e.target.value);
      }
    });
  }



}

