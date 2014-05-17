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
  }
}


/**
* Chosen tap function
**/
var chosen_tap_fun = function(){
  var select = $(this), span;

  function set_selected_data(){
    if (!span) return;

    var selected = select.val();
    if(selected && selected[0] == ""){
      selected.splice(0,1);
    }

    span.data('selected', selected);

    return selected;
  }

  set_selected_data();

  var should_hide = !select.is(':visible');
  var chosen = select.chosen().next();

  if (should_hide && !select.parents('.form-dialog').length)
    chosen.hide();

  select.parents('form').on({
    statechange: function(ev, state){
      if (state)
        chosen.show();
      else
        chosen.hide();
    },

    cancel:function(){
      var selected = span.data('selected');

      select.val(selected).trigger('liszt:updated');
    },

    'ajax:success':function(ev, result){
      try{
        if (result.errors && result.errors_size > 0){

        }else{
          var selected = set_selected_data();

          if (selected)
            span.text(selected.join(', '));
        }
      }catch(error){

      }
    },
  });
  
}