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


var AddItem = function(e){
  add_input = document.createElement("input");
  add_input.setAttribute("name","article["+ (this.id === "category" ? this.id+"_id":this.id+"_list") +"]");
  addElement(this.parentElement,'input',add_input);
}

var addElement = function(e,node,addnode){
  e.getElementsByTagName(node).length > 0 ? '':e.appendChild(addnode);
}

var removeItem = function(e){
  this.parentElement.removeChild(this.parentElement.getElementsByTagName('input')[0])
}

window.onload = function(){
  if(document.getElementById("category") !== null){
    document.getElementById("category").addEventListener("click",AddItem,false);
    document.getElementById("tag").addEventListener("click",AddItem,false);
    document.getElementById("article_category").addEventListener("change",removeItem,false);
    document.getElementById("article_tag_list").addEventListener("change",removeItem,false);  
  }
}
