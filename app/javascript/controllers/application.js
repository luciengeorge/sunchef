import {Application} from '@hotwired/stimulus'
import LazyLoader from 'stimulus-lazy-loader'

const application = Application.start()
application.register('lazy-loader', LazyLoader)

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export {application}
