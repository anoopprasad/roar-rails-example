function post(type, url, json){
   $.ajax({
      type: type,
      data: JSON.stringify(json),
      dataType: "json",
      url: url,
      success: function(resp){ alert("Response: " + resp); }
   });
}