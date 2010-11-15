$.fn.containsOption = function(value, fn)
{
  var found = false;
  var v = value;
  var vT = typeof(v);
  var fT = typeof(fn);
  // has to be a string or regular expression (object in IE, function in Firefox)
  if(vT != "string" && vT != "function" && vT != "object") return fT == "function" ? this: found;
  this.each(
    function()
    {
      if(this.nodeName.toLowerCase() != "select") return this;
      // option already found
      if(found && fT != "function") return false;
      // get options
      var o = this.options;
      // get number of options
      var oL = o.length;
      for(var i = 0; i<oL; i++)
      {
        if(v.constructor == RegExp)
        {
          if (o[i].value.match(v))
          {
            found = true;
            if(fT == "function") fn.call(o[i], i);
          }
        }
        else
        {
          if (o[i].value == v)
          {
            found = true;
            if(fT == "function") fn.call(o[i], i);
          }
        }
      }
    }
  );
  return fT == "function" ? this : found;
};

$(document).ready(function(){
  $("#event_date").datetimepicker({
    timeFormat: 'h:mm', stepMinute: 15
     });
  $("#event_form").submit(function() {
    $.post('/events/create/', $("#event_form").serialize(), function(result) {
      $('.user_message').text('Your event has been saved.');
      $("#event_form")[0].reset();
      $.get('/events/list/?limit=3', function(result) {
        $('#event_list').html(result);
      });
    });
    return false;
  });

  /* Event location dialog */

  function checkLength(o,min,max) {
    if ( o.val().length > max || o.val().length < min ) {
      return false;
    } else {
      return true;
    }
  }

  function uniqueOption(option) {
    if ( $("#event_location").containsOption(option) ){
      return false;
    } else {
      return true;
    }
  }

  var location_name = $("#location_name");
  $("#event-location-form").dialog({
        autoOpen: false,
        height: 170,
        width: 350,
        modal: true,
        buttons: {
          'Add Location': function() {
            var bValid = true;

            bValid = bValid && checkLength(location_name,1,36);

            if (bValid && uniqueOption(location_name.val())) {
              $('#event_location').append('<option value="'+ location_name.val() +'" selected="selected">'+ location_name.val() +'</option>');
              $("#new-location-error").text('');
              $(this).dialog('close');
            } else {
              $("#new-location-error").text('Please enter a unique location');
            }
          },
          Cancel: function() {
            $(this).dialog('close');
            $("#new-location-error").text('');
          }
        },
        close: function() {
          location_name.val('');
          $("#new-location-error").text('');
        }
  });

  $('#add_location')
    .click(function() {
      $('#event-location-form').dialog('open');
    });
});
