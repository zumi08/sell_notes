# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
console.log "yomikomi"
$ ->
  app.initialize()
  app.setBind()
  $("#to_college_university_id").select2({
      width:      200,  # 横幅
      allowClear: true  # x で選択したものを削除できる
      theme: "bootstrap"
      # 詳細は http://ivaynberg.github.io/select2/#documentation
    })

app =
  initialize: ->

  setBind: ->
    $(window).keyup (e) ->
      console.log "aa"
    $('#to_college_university_id').change ->
      console.log 'bbb'
      app.ajaxChangeCollege(@)

  ajaxChangeCollege: (obj) ->
    console.log "aaa"
    $.ajax
      type: 'GET'
      dataType: 'json'
      url: "/items/new/ajax_change_college"
      data: {
        university_id: $(obj).val()
      }
      success: (data) ->
        $('#user_college_id').empty()
        for obj in data
          $("#user_college_id").append("<option value='#{obj.id}'>#{obj.name}</option>")

