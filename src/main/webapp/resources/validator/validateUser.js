jQuery.validator.addMethod("checkDrop", function(value, element) {
  // allow any non-whitespace characters as the host part
  if(value!="NO"&& value!="empty"&& value!="0"){
    return true;
  }
  else return false;
});

jQuery.validator.addMethod("checkUnique", function(value, element) {
  var xmlHttp = new XMLHttpRequest();
  xmlHttp.open( "GET", "checkUserName?username="+value, false ); // false for synchronous request
  xmlHttp.send( null );
  return xmlHttp.responseText=="true";
});

jQuery.validator.addMethod("checkSchool", function(value, element) {
    var ccu =document.getElementById("occupation").value;
    if(ccu !="interviewer"){
        return true;
    }
    else {
      if(value.length<8){
        return false;
      }
      else {
          var xmlHttp = new XMLHttpRequest();
          xmlHttp.open("GET", "checkSchId?sch_id=" + value, false); // false for synchronous request
          xmlHttp.send(null);
          return xmlHttp.responseText == "false";
      }
    }
});


$(function() {

  $("form[id='contact']").validate({
    // Specify validation rules
    rules: {
      username:{
        required:true,
        minlength:6,
        checkUnique:true

      },
      password:{
        required:true,
        minlength:8
      },

      passwordConfirm:{
        required:true,
        equalTo: "#password"
      },

      occupation:{
        required:true,
        checkDrop:true
      },
      sch : {
          checkSchool : true

      }



      
    },
    // Specify validation error messages
    messages: {
      username:"enter long/unused username",
      password:"enter at least 8 chars",
      passwordConfirm:"passwords dont match",
      occupation:"select occupation",
        sch :{

            checkSchool : "enter valid school"
        }

    },
    // Make sure the form is submitted to the destination defined
    // in the "action" attribute of the form when valid
    submitHandler: function(form) {
      form.submit();
    }
  });
});
