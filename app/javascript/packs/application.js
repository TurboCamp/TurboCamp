// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

<<<<<<< HEAD
import Rails from '@rails/ujs'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import 'stylesheets/application'
import LocalTime from 'local-time'
import "@hotwired/turbo-rails"
=======
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "stylesheets/application";
import LocalTime from "local-time"

LocalTime.start()
>>>>>>> 專案圖片上傳預覽

LocalTime.start()
Rails.start()
ActiveStorage.start()

require('trix')
require('@rails/actiontext')

import 'controllers'
