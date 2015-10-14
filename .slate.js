slate.configAll({
  'defaultToCurrentScreen': true,
  'modalEscapeKey': 'esc',
  'windowHintsFontColor': [255, 210, 70, 1],
  'windowHintsIgnoreHiddenWindows': false,
  'windowHintsShowIcons': true,
  'windowHintsSpread': true,
  'windowHintsHeight': 60,
  'windowHintsWidth': 60,
});

var modal = 'ctrl,shift,m';
var keys = {
  hints: 'e:cmd',
  undo: 'z:' + modal,
  restart: 'r:' + modal,

  safari: 'c:alt',
  iterm: 't:alt',
  macvim: 'v:alt',
  messages: 'm:alt',
  skype: 's:alt',
  slack: 'b:alt',

  grid: 'g:' + modal,
  fullscreen: 'f:' + modal,
  center: 'c:' + modal,
  halfLeft: 'h:' + modal,
  halfRight: 'l:' + modal,
}

slate.bind(keys.hints, slate.operation('hint'));
slate.bind(keys.undo, slate.operation('undo'));
slate.bind(keys.restart, slate.operation('relaunch'));

/**
 * Application switching.
 */

slate.bind(keys.safari, slate.operation('focus', { 'app': 'Safari' }));
slate.bind(keys.iterm, slate.operation('focus', { 'app': 'iTerm2' }));
slate.bind(keys.macvim, slate.operation('focus', { 'app': 'MacVim' }));
slate.bind(keys.messages, slate.operation('focus', { 'app': 'Messages' }));
slate.bind(keys.skype, slate.operation('focus', { 'app': 'Skype' }));
slate.bind(keys.slack, slate.operation('focus', { 'app': 'Slack' }));

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
