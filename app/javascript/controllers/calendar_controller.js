import { Controller } from "@hotwired/stimulus"
import Cal from 'tui-calendar';
import Rails from '@rails/ujs'
import TuiDatePicker from 'tui-date-picker'
import TuiCodeSnippet from 'tui-code-snippet'

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
    fetch(url)
      .then(response => response.json())
      .then(response => response.forEach(schedule => {
        console.log(schedule);
        
        this.calendar.createSchedules([
          {
            id: schedule.id,
            title: schedule.title,
            location: schedule.location,
            calendarId: schedule.calendar_id,
            category: 'time',
            start: schedule.start,
            dueDateClass: schedule.dataDataClass,
            end: schedule.end,
          }])}))    
      }
  // 在日曆上新增行程
  createCalendarSchedule() {
    let calendar = this.calendar
    calendar.on('beforeCreateSchedule', (e) => {
      let schedule = {
        id: 1,
        calendarId: e.calendarId,
        title: e.title,
        category: 'time',
        location: e.location,
        start: e.start,
        end: e.end,
      }
      calendar.createSchedules([schedule])
      let formData = new FormData()
      formData.append('[schedule]title', schedule.title)
      formData.append('[schedule]start', schedule.start._date)
      formData.append('[schedule]end', schedule.end._date)
      formData.append('[schedule]location', schedule.location)
      formData.append('[schedule]calendar_id', schedule.calendarId)

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
      if (changes.calendarId) {
        formUpdate.append('[schedule]calendar_id', changes.calendarId)
      }
      calendar.updateSchedule(schedule.id, schedule.calendarId, changes, {
        start: e.startTime,
        end: e.endTime,
        title: e.title,
        location: e.location,
        calendar_id: e.calendarId
    });
      
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
        }  
    })

    this.calendar.setCalendarColor('1', {
      color: '#ffffff',
      bgColor: '#9e5fff',
      dragBgColor: '#000',
      borderColor: '#9e5fff',
    })
    this.calendar.setCalendarColor('2', {
      color: '#ffffff',  
      bgColor: '#00a9ff',
      dragBgColor: '#00a9ff',
      borderColor: '#00a9ff',
    })
    this.calendar.setCalendarColor('3', {
      color: '#ffffff',
      bgColor: '#fa0',
      dragBgColor: '#fa0',
      borderColor: '#fa0',
    })
    this.calendar.setCalendarColor('4', {
      color: '#ffffff',
      bgColor: '#00a',
      dragBgColor: '#00a',
      borderColor: '#00a',
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

