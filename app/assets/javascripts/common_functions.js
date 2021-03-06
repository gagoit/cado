/**
* This file content some common function that will be use in some where
**/

/**
* Include common functions for the application
**/
var Gagoit = {
  /**
  * Show Alert Html
  **/
  showAlertHtml: function(field, type, html) {
    field.find(".gagoit-alert").remove();
    field.append($("<div class='gagoit-alert " + type + " fade in alert-msg-align'><a class='close' data-dismiss='gagoit-alert'>×</a>" + html + "</div>"));
    
    field.find(".gagoit-alert").delay(5000).fadeOut("slow", function () { $(this).remove();});

    field.find(".close").click(function(){
      field.find(".gagoit-alert").remove();
    });
  },

  /**
  * Show Alert message
  **/
  showAlertMessage: function(field, type, message) {
    field.find(".gagoit-alert").remove();
    field.append($("<div class='gagoit-alert " + type + " fade in alert-msg-align'><a class='close' data-dismiss='gagoit-alert'>×</a><p> " + message + " </p></div>"));
    
    field.find(".gagoit-alert").delay(5000).fadeOut("slow", function () { $(this).remove();});
    
    field.find(".close").click(function(){
      field.find(".gagoit-alert").remove();
    });
  },

  /**
  * Check Url is in Text or not
  **/
  checkUrlInText: function(text){
    if(new RegExp("([a-zA-Z0-9]+://)?([a-zA-Z0-9_]+:[a-zA-Z0-9_]+@)?([a-zA-Z0-9.-]+\\.[A-Za-z]{2,4})(:[0-9]+)?(/.*)?").test(text)) {
            return true;
    }
    return false;
  },

  /**
  * 
  */
  disable_edit: function(field){
    $(field).keydown(function(event) {
      //event.preventDefault();
      return false;
    });

    $(field).on("cut copy paste contextmenu",function(e) {
      e.preventDefault();
    });
  },

  /**
  * auto hide flash
  * @author DatPB
  **/
  auto_hide_flash: function(){
    if($(".alert").length > 0){
      $(".alert").delay(6000).fadeOut("slow", function () { $(this).remove();});
    }
  },

  /**
  * render Action
  * @author DatPB
  **/
  renderAction: function(obj){
    return  '<div class="btn-group action">' +
              '<button type="button" class="btn btn-small view" value="'+obj.aData.id+'><span class="fa fa-eye"></span></button>' +
              '<button type="button" class="btn btn-small destroy" value="'+obj.aData.id+'><span class="fa fa-trash-o"></span></button>' +
            '</div>';
  },

  /**
  * render Image
  * @author DatPB
  **/
  renderImage: function(obj){
    return '<img src="'+obj.aData.avatar+'" '+"class='user-avatar'"+'>';
  },

  /**
  * render Money
  * @author DatPB
  **/
  renderMoney: function(value){
    return value;
  }
}

$(function() {
  Gagoit.auto_hide_flash();
});