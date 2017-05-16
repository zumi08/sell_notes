(function() {
  var app;

  console.log("yomikomi");

  $(function() {
    app.initialize();
    app.setBind();
    return $(".searchable").select2({
      width: 200,
      allowClear: true
    });
  });

  app = {
    initialize: function() {},
    setBind: function() {
      $(window).keyup(function(e) {
        return console.log("aa");
      });
      return $('#to_college_university_id').change(function() {
        console.log('bbb');
        return app.ajaxChangeCollege(this);
      });
    },
    ajaxChangeCollege: function(obj) {
      console.log("aaa");
      return $.ajax({
        type: 'GET',
        dataType: 'json',
        url: "/items/new/ajax_change_college",
        data: {
          university_id: $(obj).val()
        },
        success: function(data) {
          var i, len, results;
          $('#item_college_id').empty();
          results = [];
          for (i = 0, len = data.length; i < len; i++) {
            obj = data[i];
            results.push($("#item_college_id").append("<option value='" + obj.id + "'>" + obj.name + "</option>"));
          }
          return results;
        }
      });
    }
  };

}).call(this);
