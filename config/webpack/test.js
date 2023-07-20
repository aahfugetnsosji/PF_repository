process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()

$(document).ready(function () {
  $('.jquery').on('click', function(){
    $(this).css('color','red');
  });
});