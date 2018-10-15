# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.draw_graph = -> 
    ctx = document.getElementById("myChart").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'radar',
        data: {
            labels: ["攻撃", "フィジカル", "スタミナ", "守備", "戦術", "テクニック"],
            datasets: [{
                data: gon.data,
                backgroundColor: [
                    'rgba(255, 251, 71, 0.6)'
                ],
                borderWidth: 1
                pointRadius: 0,
            }]
        },
        options: {
            legend: {display:false}
            scale: {
                    ticks: {
                        beginAtZero:true
                        min:0
                        max:10
                    }
            }
        }
    })
    
$(document).on 'change', '#team_info_pref_id', ->
  $.ajax(
    type: 'GET'
    url: '/teams/get_facilities'
    data: {
      pref_id: $(this).val()
    }
  ).done (data) ->
    $('#teaminfo_facility_id').html(data)