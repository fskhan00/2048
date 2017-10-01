var gameOver = false;
var numbers = [];
var zeroes = [];
var maxX = 4;
var maxY = 4;
var gridSq = 100;
var gridSpace = 10;
var gridSize = gridSpace + gridSq;
var possibleMoves = 1;
var oldNumbers = '';
var speed = 100;
var points = 0;
var colors = {
  2: '#F9BA32',
  4: '#D4AA42',
  8: '#AF9B53',
  16: '#8B8C64',
  32: '#667D75',
  64: '#426E86',
  128: '#3E6175',
  256: '#3A5564',
  512: '#364953',
  1024: '#323D42',
  2048: '#2F3131',
  4096: '#232424',
  8192: '#171818',
  16384: '#080C0C',
  32768: '#000000'
};


function containerBuild() {
  $('.container').css({
    'width': (gridSq * maxX + gridSpace *(maxX - 1)) + 'px', 'padding': gridSpace + 'px'
  });
  gridBuild();
  titleSize();
}
