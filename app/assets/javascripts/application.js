// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function () {
  $('.btn_toggle').click(function(){
  	var which = $(this).parents('.pure-control-group').find('select').attr('class');
  	if($(this).next().is('.new_category')){
  		$(this).next().remove();
  		$(this).text('New '+which);
  	} else {
  		var html = '<div class="new_category"><input class="form-control inline" id="article_category" name="article[category]" placeholder="新規カテゴリー" type="text"></div>';
      $(this).parent().append(html);
      $(this).text('キャンセル');
  	}
  });

});