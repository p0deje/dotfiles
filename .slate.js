slate.configAll({
  'defaultToCurrentScreen': true,
  'modalEscapeKey': 'esc',
  'windowHintsDuration': 10,
  'windowHintsFontName': 'Monaco',
  'windowHintsFontColor': [255, 255, 0, 1],
  'windowHintsIgnoreHiddenWindows': false,
  'windowHintsShowIcons': true,
  'windowHintsSpread': true,
  'windowHintsHeight': 60,
  'windowHintsWidth': 60,
});

var modal = 'ctrl,shift,m';
var keys = {
  hints:   'e:cmd',
  undo:    'z:' + modal,
  restart: 'r:' + modal,

  chrome:   'c:alt',
  hipchat:  'b:alt',
  iterm:    't:alt',
  macvim:   'v:alt',
  messages: 'm:alt',

  grid:          'g:' + modal,
  fullscreen:    'f:' + modal,
  center:        'c:' + modal,
  halfLeft:      'h:' + modal,
  halfRight:     'l:' + modal,

  extra_small: '8:' + modal,
  small:       '9:' + modal,
}

slate.bind(keys.hints, slate.operation('hint'));
slate.bind(keys.undo, slate.operation('undo'));
slate.bind(keys.restart, slate.operation('relaunch'));

/**
 * Application switching.
 */

slate.bind(keys.chrome,   slate.operation('focus', { 'app': 'Google Chrome' }));
slate.bind(keys.hipchat,  slate.operation('focus', { 'app': 'HipChat'       }));
slate.bind(keys.iterm,    slate.operation('focus', { 'app': 'iTerm'         }));
slate.bind(keys.macvim,   slate.operation('focus', { 'app': 'MacVim'        }));
slate.bind(keys.messages, slate.operation('focus', { 'app': 'Messages'      }));

/**
 * Window resizing.
 */

slate.bind(keys.grid, slate.operation('grid', {
  'grids': {
    '2560x1440': {
      'width': 48,
      'height': 24,
    }
  }
}));

slate.bind(keys.fullscreen, slate.operation('move', {
  "x": "screenOriginX",
  "y": "screenOriginY",
  "width": "screenSizeX",
  "height": "screenSizeY",
}));

slate.bind(keys.center, slate.operation('move', {
  "x": "screenOriginX + (screenSizeX - windowSizeX) / 2",
  "y": "screenOriginY + (screenSizeY - windowSizeY) / 2",
  "width": "windowSizeX",
  "height": "windowSizeY",
}));

slate.bind(keys.halfLeft, slate.operation('move', {
  "x": "screenOriginX",
  "y": "screenOriginY",
  "width": "screenSizeX / 2",
  "height": "screenSizeY",
}));

slate.bind(keys.halfRight, slate.operation('move', {
  "x": "screenOriginX + (screenSizeX / 2)",
  "y": "screenOriginY",
  "width": "screenSizeX / 2",
  "height": "screenSizeY",
}));

slate.bind(keys.extra_small, slate.operation('move', {
  "x": "screenOriginX + (screenSizeX / 20)",
  "y": "screenOriginY + (screenSizeY / 20)",
  "width": "screenSizeX - (screenSizeX / 20 * 2)",
  "height": "screenSizeY - (screenSizeY / 20 * 2)",
}));

slate.bind(keys.small, slate.operation('move', {
  "x": "screenOriginX + (screenSizeX / 80)",
  "y": "screenOriginY + (screenSizeY / 80)",
  "width": "screenSizeX - (screenSizeX / 80 * 2)",
  "height": "screenSizeY - (screenSizeY / 80 * 2)",
}));


/**
 * Different monitors.
 */

var macbook = '3360x2100';
var thunderbolt = '2560x1440';

