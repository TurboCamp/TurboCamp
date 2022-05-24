# frozen_string_literal: true

json.array! @schedules, partial: 'project_id/schedules/schedule', as: :schedule
