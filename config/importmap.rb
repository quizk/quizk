# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin 'popper', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin 'jet-theme-scripts', to: 'jet-theme/scripts.bundle.js'

pin '@fortawesome/fontawesome-free', to: '@fortawesome--fontawesome-free.js' # @6.1.1
pin '@fortawesome/fontawesome-svg-core', to: '@fortawesome--fontawesome-svg-core.js' # @6.1.1
pin '@fortawesome/free-solid-svg-icons', to: '@fortawesome--free-solid-svg-icons.js' # @6.1.1
pin 'jquery', preload: true # @3.6.0
