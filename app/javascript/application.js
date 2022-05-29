// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import 'popper'
import 'bootstrap'
import 'jet-theme-scripts'

import '@fortawesome/fontawesome-free'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { library } from '@fortawesome/fontawesome-svg-core'
library.add(fas)

import jQuery from 'jquery'
window.$ = jQuery
