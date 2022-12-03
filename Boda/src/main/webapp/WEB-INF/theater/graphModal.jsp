<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        		<!-- datepicker 관련-->
<link rel="stylesheet" href="resources/datepicker/1.12.1/jquery-ui.css">
<script src="resources/datepicker/jquery-1.12.4.js"></script>
<script src="resources/datepicker/1.12.1/jquery-ui.js"></script>
<script src="resources/datepicker/jquery.mtz.monthpicker.js"></script>
 

<script>
$(function() {
/* MonthPicker Set */
$('#datepicker-month').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
$('#datepicker-month').monthpicker({
pattern: 'yyyy-mm', // Default is 'mm/yyyy' and separator char is not mandatory
monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
});

});

$(function() {
/* MonthPicker Set */
$('#datepicker-month2').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
$('#datepicker-month2').monthpicker({
pattern: 'yyyy-mm', // Default is 'mm/yyyy' and separator char is not mandatory
monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
});

});

function sendDate(){
	$('#myChart2').remove();
	$('#myChart2Container').append('<canvas id="myChart2" height="350" width="350"></canvas>');
	
	 
	//alert($('#datepicker-month').val());
	let timelist = [];
	let datalist = [];
	$.ajax({
		url:'visit.th',
		data:{'visit_date' : $('#datepicker-month').val()},
		type:'POST',
		dataType : 'json',
		success : function(map){ //날짜와 cnt
			//alert('성공');
			
			//해당 월의 마지막날짜까지 넣기
				$.each(map.visit, function(index, item) {
					console.log(item.visit_date);
					
					console.log(item.cnt);
					timelist.push(item.visit_date);
					datalist.push(item.cnt);
					//chart1data.push({x:day+"일", y:item.cnt});
				});//each
			
				var chartArea2 = document.getElementById('myChart2').getContext('2d'); //방문 count
				var myChart2 = new Chart(chartArea2,  {
				    // ①차트의 종류(String)
				    type: 'line',
				    // ②차트의 데이터(Object)
				    data: {
				        // ③x축에 들어갈 이름들(Array)
				        labels: timelist,
				        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
				        datasets: [{
				            // ⑤dataset의 이름(String)
				            label: 'Operating visitors of Boda',
				            // ⑥dataset값(Array)
				            data:datalist,
				            // ⑦dataset의 배경색(rgba값을 String으로 표현)
				            backgroundColor: 'rgba(255, 99, 132, 0.2)',
				            // ⑧dataset의 선 색(rgba값을 String으로 표현)
				            borderColor: 'rgba(255, 99, 132, 1)',
				            // ⑨dataset의 선 두께(Number)
				            borderWidth: 1
				        }
				        ]
				    },
				    // ⑩차트의 설정(Object)
				    options: {
				        // ⑪축에 관한 설정(Object)
				        scales: {
				            // ⑫y축에 대한 설정(Object)
				            y: {
				                // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
				                beginAtZero: true
				            }
				        }
				    }
				});

			
			
			
		},
		error: function (xhr, status, error) {
			alert("visit.th실패"); 
			} 
		
	}); //ajax 
}

///chart3
function sendDate3(){
	$('#myChart3').remove();
	$('#myChart3Container').append('<canvas id="myChart3" height="350" width="350"></canvas>');
	
	 
	//alert($('#datepicker-month').val());
	let timelist3 = [];
	let datalist3 = [];
	$.ajax({
		url:'moviebooking.th',
		data:{'reserve_date' : $('#datepicker-month2').val(),
			't_name':'${tb.t_theater}'
		},
		type:'POST',
		dataType : 'json',
		success : function(map){ //날짜와 cnt
			//alert('성공');
			
			//해당 월의 마지막날짜까지 넣기
				$.each(map.rlist, function(index, item) {
					console.log(item.rday);
					
					console.log(item.rcnt);
					timelist3.push(item.rday);
					datalist3.push(item.rcnt);
					//chart1data.push({x:day+"일", y:item.cnt});
				});//each
			
				var chartArea3 = document.getElementById('myChart3').getContext('2d'); //reserve table count
				var myChart3 = new Chart(chartArea3,  {
				    // ①차트의 종류(String)
				    type: 'line',
				    // ②차트의 데이터(Object)
				    data: {
				        // ③x축에 들어갈 이름들(Array)
				        labels: timelist3,
				        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
				        datasets: [{
				            // ⑤dataset의 이름(String)
				            label: 'Operating booked Movie of ${theaterBean.t_name}',
				            // ⑥dataset값(Array)
				            data:datalist3,
				            // ⑦dataset의 배경색(rgba값을 String으로 표현)
				            backgroundColor: 'rgba(255, 99, 132, 0.2)',
				            // ⑧dataset의 선 색(rgba값을 String으로 표현)
				            borderColor: 'rgba(255, 99, 132, 1)',
				            // ⑨dataset의 선 두께(Number)
				            borderWidth: 1
				        },
				        {
				            type: 'bar', // 💗
				            label:'',
				            borderColor: 'rgb(54, 162, 235)',
				            borderWidth: 2,
				            fill: false,
				            data:datalist3,
				          }
				        ]
				    },
				    // ⑩차트의 설정(Object)
				    options: {
				        // ⑪축에 관한 설정(Object)
				        scales: {
				            // ⑫y축에 대한 설정(Object)
				            y: {
				                // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
				                beginAtZero: true
				            }
				        }
				    }
				});
		},
		error: function (xhr, status, error) {
			alert("moviebooking.th실패"); 
			} 
		
	}); //ajax 
}

</script>
</head>
<body>
 <%@ include file="/WEB-INF/common/common.jsp" %>
<!--income Modal 시작 -->
  <div class="modal fade" id="income">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">&nbsp;&nbsp;&nbsp;매출현황</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <canvas id="myChart" width="350px" height="350px"></canvas>   
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal" id="income">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
  
<!-- visit Modal 시작 -->
  <div class="modal fade" id="visit">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
      
			<input type="text" value="연월선택" class="btn btn-outline-primary" onchange="sendDate()" value="" name="edate" id="datepicker-month" readonly autocomplete='off' >
			
          <h4 class="modal-title">&nbsp;&nbsp;&nbsp;방문현황</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" id="myChart2Container">
           <canvas id="myChart2" width="350px" height="350px"></canvas>   
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
        </div>
        
      </div>
    </div>
  </div>
  
<!-- movie_booking Modal 시작 -->
  <div class="modal fade" id="movie_booking" >
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" >
			<input type="text" value="연월선택" class="btn btn-outline-primary" onchange="sendDate3()" value="" name="edate" id="datepicker-month2" readonly autocomplete='off' >
          <h4 class="modal-title">&nbsp;&nbsp;&nbsp;예매현황</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" id="myChart3Container">
           <canvas id="myChart3" width="350px" height="350px" style="width:350px; height: 350px;"></canvas>   
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  
<!-- // 차트를 그릴 영역으로 canvas태그를 사용한다.
<canvas id="myChart" width="400" height="400"></canvas> -->

<!-- // 해당 부분은 JS파일을 따로 만들어서 사용해도 된다. -->
<script>
// 차트를 그럴 영역을 dom요소로 가져온다.
var chartArea1 = document.getElementById('myChart').getContext('2d');
// 차트를 생성한다. 
var myChart = new Chart(chartArea1,  {
    // ①차트의 종류(String)
    type: 'bar',
    // ②차트의 데이터(Object)
    data: {
        // ③x축에 들어갈 이름들(Array)
        labels: ['2019', '2020', '2021', '2022'],
        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
        datasets: [{
            // ⑤dataset의 이름(String)
            label: 'Operating income of ${theaterBean.t_name}',
            // ⑥dataset값(Array)
            data: [${theaterBean.y2019}, ${theaterBean.y2020}, ${theaterBean.y2021}, ${theaterBean.y2022}],
            // ⑦dataset의 배경색(rgba값을 String으로 표현)
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            // ⑧dataset의 선 색(rgba값을 String으로 표현)
            borderColor: 'rgba(255, 99, 132, 1)',
            // ⑨dataset의 선 두께(Number)
            borderWidth: 1
        },
        {
            type: 'line', // 💗
            label:'',
            borderColor: 'rgb(54, 162, 235)',
            borderWidth: 2,
            fill: false,
            data: [${theaterBean.y2019},${theaterBean.y2020},${theaterBean.y2021},${theaterBean.y2022}],
          }
        ]
    },
    // ⑩차트의 설정(Object)
    options: {
        // ⑪축에 관한 설정(Object)
        scales: {
            // ⑫y축에 대한 설정(Object)
            y: {
                // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
                beginAtZero: true
            }
        }
    }
});



</script>


</body>
</html>