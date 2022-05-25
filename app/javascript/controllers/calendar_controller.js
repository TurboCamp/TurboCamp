import { Controller } from "@hotwired/stimulus"
import Cal from 'tui-calendar';
import Rails from '@rails/ujs'

export default class extends Controller {
  
  connect() {
    this.calendar = new Cal(document.getElementById('calendar'), {
      id: "1",
        name: "schedule",
        defaultView: 'month',
        color: '#fa0',
          bgColor: '#ff0',
          dragBgColor: '#fa0',
          borderColor: '#fa0',
        // milestone: true,   
        scheduleView: true,  
        useCreationPopup: true,
      useDetailPopup: true,
      isAllDay: false,
      template: {
        // allday: function(schedule) {
        //   return getTimeTemplate(schedule, true);
        // },
        alldayTitle: function() {
            return '<span class="tui-full-calendar-left-content">one</span>';
        },
      }
    })
    this.getCalendarData()
    this.createCalendarSchedule()
    this.updatedCalendarSchedule()
    this.deleteCalendarSchedule()
  }
  getCalendarData() {
    let url = './schedules.json'
    fetch(url)
      .then(response => response.json())
      .then(response => response.forEach(schedule => {
        this.calendar.createSchedules([
          {
            id: schedule.id,
            title: schedule.title,
            location: schedule.location,
            category: 'time',
            dueDateClass: schedule.dataDataClass,
            start: schedule.start,
            end: schedule.end
          }
        ])
      }))
  }

  // 在日曆上新增行程
  createCalendarSchedule() {
    let calendar = this.calendar
    calendar.on('beforeCreateSchedule', (e) => {
      let schedule = {
        id: 1,
        calendarId: '1',
        title: e.title,
        category: 'time',
        location: e.location,
        start: e.start,
        end: e.end
      }
      calendar.createSchedules([schedule])
      let formData = new FormData()
      formData.append('[schedule]title', schedule.title)
      formData.append('[schedule]start', schedule.start._date)
      formData.append('[schedule]end', schedule.end._date)
      formData.append('[schedule]location', schedule.location)

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
      calendar.updateSchedule(schedule.id, schedule.calendarId, changes)

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
}

