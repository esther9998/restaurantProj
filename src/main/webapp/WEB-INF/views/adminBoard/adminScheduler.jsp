<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<meta charset='utf-8' />
<style>
.form-field-icon-wrap .icon {
    color: gray;
    position: absolute;
    top: 50%;
    right: 20px;
    font-size: 18px;
    -webkit-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    transform: translateY(-50%);
</style>

<script>
/*
데이터 : controller에서 예약 스케줄 가져온뒤, 캘린더 데이터 양식으로 변환, 화면에 뿌려줌. 
*/
	/*  var data = ${reserveList};
	var dataArray = new Array();
	function
	resetData() {
		for (var i = 0; i < data.length; i++) {
			var resetData = new Object();  */
			/*  해당 변수에 데이터 저장 (풀캘린더 속성에 맞춰서!!)
			resetData.title = data[i].reserv_name;
			resetData.start = data[i].reserv_date
			resetData.description[0] =  data[i].reserv_idx 
			resetData.description[1] =  data[i].reserv_phone 
			resetData.description[2] =  data[i].reserv_email
			resetData.description[3] =  data[i].reserv_persons
			resetData.description[4] =  data[i].reserv_time
			resetData.description[5] =  data[i].reserv_register
			resetData.description[6] =  data[i].reserv_etc
			resetData.id = data[i].reserv_status;
			*/
			/* resetData.title = data[i].reserv_name;
			resetData.start = moment(new Date(data[i].reserv_date)).format('YYYY-MM-DD');
			resetData.description= [ data[i].reserv_idx,data[i].reserv_phone,data[i].reserv_email,data[i].reserv_persons,data[i].reserv_time,data[i].reserv_register,data[i].reserv_etc];
			resetData.id = data[i].reserv_status;
			dataArray.push(resetData);
		} 
		console.log(dataArray);
	}
	resetData();*/
	
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar;
    
    initThemeChooser({

      init: function(themeSystem) {
        calendar = new FullCalendar.Calendar(calendarEl, {
          plugins: [ 'bootstrap', 'interaction', 'dayGrid', 'timeGrid', 'list' ],
          themeSystem: themeSystem,
          customButtons: { 
        	  addEvent: { 
                  text: 'Add Event', 
                  click: function(event) { 
                	  $('#addEvent').modal();
                  } 
              } 
      }, 
          header: {
            left: 'prev,next today,addEvent',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
          },
          defaultDate: new Date(),
          weekNumbers: true,
          navLinks: true, // can click day/week names to navigate views
          editable: true,
          eventLimit: true, // allow "more" link when too many events
     resources: [
        	  // 예약 상태를 id로 알
        	    { id: 0, title: 'Booking' },
        	    { id: 1, title: 'Attend' },
        	    { id: 2, title: 'Cancel' },
        	    { id: 3, title: 'Miss' }
        	  ], 
          events: function () {
        	  $.ajax({ 
        		     url: '/getSchedule', 
        		     dataType: 'json', 
        		     type: "GET",
        		     success: function(rst ,callback) { 
        		      var events = []; 
        		      $.each(rst, function(index, oneData) { 
        		       events.push({ 
        		        title: oneData.reserv_name, 
        		        start: moment(new Date(oneData.reserv_date)).format('YYYY-MM-DD')

        		       });
        		      }); 
        		      callback(events); 
        		     } 
        		    }) //ajax 
		},
           eventClick:function(info) {
        	   console.log(info.event.title);
        	   console.log(info.event.start);
        	   console.log(info.event.description);
          	   $('#eventDetails').modal(info);
      			$('#name').val(info.event.title);
      			$("#phone").val();
				$("#email").val(info.event.description[2]);
				$("#persons").val();
				$("#date").val(info.event.start);
				$("#time").val();
				 console.log(event); 
          	   
            }

        });
        calendar.render();
      },

      change: function(themeSystem) {
        calendar.setOption('themeSystem', themeSystem);
      }

    });

  });

</script>
<style>

  body {
    margin: 0;
    padding: 0;
    font-size: 14px;
  }

  #top,
  #calendar.fc-unthemed {
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  }

  #top {
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    font-size: 12px;
    color: #000;
  }

  #top .selector {
    display: inline-block;
    margin-right: 10px;
  }

  #top select {
    font: inherit; /* mock what Boostrap does, don't compete  */
  }

  .left { float: left }
  .right { float: right }
  .clear { clear: both }

  #calendar {
    max-width: 900px;
    margin: 40px auto;
    padding: 0 10px;
  }

</style>
</head>
<!--  top 부분 안보이게 처리 , 삭제시 캘리더 안나옴  -->
  <div id='top' style="display: none;">

    <div class='left'>

      <div id='theme-system-selector' class='selector'>
        Theme System:

        <select>
          <option value='bootstrap' selected>Bootstrap 4</option>
          <option value='standard'>unthemed</option>
        </select>
      </div>

      <div data-theme-system="bootstrap" class='selector' style='display:none'>
        Theme Name:

        <select>
          <option value='' selected>Default</option>
          <option value='cerulean'>Cerulean</option>
          <option value='cosmo'>Cosmo</option>
          <option value='cyborg'>Cyborg</option>
          <option value='darkly'>Darkly</option>
          <option value='flatly'>Flatly</option>
          <option value='journal'>Journal</option>
          <option value='litera'>Litera</option>
          <option value='lumen'>Lumen</option>
          <option value='lux'>Lux</option>
          <option value='materia'>Materia</option>
          <option value='minty'>Minty</option>
          <option value='pulse'>Pulse</option>
          <option value='sandstone'>Sandstone</option>
          <option value='simplex'>Simplex</option>
          <option value='sketchy'>Sketchy</option>
          <option value='slate'>Slate</option>
          <option value='solar'>Solar</option>
          <option value='spacelab'>Spacelab</option>
          <option value='superhero'>Superhero</option>
          <option value='united'>United</option>
          <option value='yeti'>Yeti</option>
        </select>
      </div>

      <span id='loading' style='display:none'>loading theme...</span>

    </div>

    <div class='right'>
      <span class='credits' data-credit-id='bootstrap-standard' style='display:none'>
        <a href='https://getbootstrap.com/docs/3.3/' target='_blank'>Theme by Bootstrap</a>
      </span>
      <span class='credits' data-credit-id='bootstrap-custom' style='display:none'>
        <a href='https://bootswatch.com/' target='_blank'>Theme by Bootswatch</a>
      </span>
    </div>

    <div class='clear'></div>
  </div>

  <div id='calendar'></div>
  <jsp:include page="./adminModal/updateModal.jsp"></jsp:include>
  <jsp:include page="./adminModal/addEventModal.jsp"></jsp:include>
  

