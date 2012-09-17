function post(method, uri, data)
{
  json = data ? JSON.stringify(data) : null;
  $.ajax({
    type: method,
    data: json,
    url: uri,
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function(resp){ alert("Response: " + resp); },
    failure: function(resp){ alert("Failed: " + resp); }
  });
}
