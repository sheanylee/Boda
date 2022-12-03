<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp"%>

<meta content="IE=EmulateIE7" http-equiv=X-UA-Compatible />

<link
	href=https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css
	rel=stylesheet type=text/css>
<script type=text/javascript
	src=https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js></script>
<script type=text/javascript src=jquery.tinysort.min.js></script>
<!--[if IE]><script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jit/2.0.2/Extras/excanvas.min.js"></script><![endif]-->
<script type=text/javascript>
// Helpers
	shuffle = function(o) {
		for ( var j, x, i = o.length; i; j = parseInt(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x)
			;
		return o;
	};

	String.prototype.hashCode = function(){
		// See http://www.cse.yorku.ca/~oz/hash.html		
		var hash = 5381;
		for (i = 0; i < this.length; i++) {
			char = this.charCodeAt(i);
			hash = ((hash<<5)+hash) + char;
			hash = hash & hash; // Convert to 32bit integer
		}
		return hash;
	}

	Number.prototype.mod = function(n) {
		return ((this%n)+n)%n;
	}
</script>
<script type=text/javascript>


/*
	Copyright (c) 2011, Andrew Brampton (bramp.net)
	All rights reserved.

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:
	* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
	* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
	* Neither the name of the <copyright holder> nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

	var a = "500포인트";
	var b = "1000포인트";
	var c = "1500포인트";
	var d = "2000포인트";
	var e = "다음기회에";

venues = {
		a,b,c,d,e
	};
	

	$(function() {

		var venueContainer = $('#venues ul');
		$.each(venues, function(key, item) {
			venueContainer.append(
		        $(document.createElement("li"))
		        .append(
	                $(document.createElement("input")).attr({
                         id:    'venue-' + key
                        ,name:  item
                        ,value: item
                        ,type:  'checkbox'
                        ,checked:true
	                })
	                .change( function() {
	                	var cbox = $(this)[0];
	                	var segments = wheel.segments;
	                	var i = segments.indexOf(cbox.value);

	                	if (cbox.checked && i == -1) {
	                		segments.push(cbox.value);

	                	} else if ( !cbox.checked && i != -1 ) {
	                		segments.splice(i, 1);
	                	}

	                	segments.sort();
	                	wheel.update();
	                } )

		        ).append(
	                $(document.createElement('label')).attr({
	                    'for':  'venue-' + key
	                })
	                .text( item )
		        )
		    )
		});

		$('#venues ul>li').tsort("input", {attr: "value"});
	});

/****************************************
 * Wheel starts here
 ***************************************/

	var wheel = {

		timerHandle : 0,
		timerDelay : 33,

		angleCurrent : 0,
		angleDelta : 0,
		
		size : 200, //wheel 크기

		canvasContext : null,

		colors : [ '#C3F8FF', '#ABD9FF', '#FFF6BF', '#FF9494', '#FFDBA4','#FFB4B4','#ABC9FF','#F2D7D9','#FFE6E6','#FAD4D4' ],

		//segments : [ 'Andrew', 'Bob', 'Fred', 'John', 'China', 'Steve', 'Jim', 'Sally', 'Andrew', 'Bob', 'Fred', 'John', 'China', 'Steve', 'Jim'],
		segments : [],

		seg_colors : [], // Cache of segments to colors
		
		maxSpeed : Math.PI / 16,

		upTime : 1000, // How long to spin up for (in ms)
		downTime : 10000, // How long to slow down for (in ms)

		spinStart : 0,

		frames : 0,

		centerX : 300,
		centerY : 300,

		spin : function() {

			// Start the wheel only if it's not already spinning
			if (wheel.timerHandle == 0) {
				wheel.spinStart = new Date().getTime();
				wheel.maxSpeed = Math.PI / (16 + Math.random()); // Randomly vary how hard the spin is
				wheel.frames = 0;
				wheel.sound.play();

				wheel.timerHandle = setInterval(wheel.onTimerTick, wheel.timerDelay);
			}
		},

		onTimerTick : function() {

			wheel.frames++;

			wheel.draw();

			var duration = (new Date().getTime() - wheel.spinStart);
			var progress = 0;
			var finished = false;
			
			//
			var ctx = wheel.canvasContext;
			var centerX = wheel.centerX;
			var centerY = wheel.centerY;
			var size = wheel.size;

			ctx.lineWidth = 1;
			ctx.strokeStyle = '#000000';
			ctx.fileStyle = '#ffffff';

			ctx.beginPath();

			ctx.moveTo(centerX + size - 40, centerY);
			ctx.lineTo(centerX + size + 20, centerY - 10);
			ctx.lineTo(centerX + size + 20, centerY + 10);
			ctx.closePath();

			ctx.stroke();
			ctx.fill();

			// Which segment is being pointed to?
			var i = wheel.segments.length - Math.floor((wheel.angleCurrent / (Math.PI * 2))	* wheel.segments.length) - 1;

			// Now draw the winning name
			ctx.textAlign = "left";
			ctx.textBaseline = "middle";
			ctx.fillStyle = '#D2001A'; //화살표 글자 색
			ctx.font = "1.5em Arial"; //룰렛 돌아갈때 글자 나오면서 바뀜.
			ctx.fillText(wheel.segments[i], centerX + size + 25, centerY);
			
			//
			if (duration < wheel.upTime) {
				progress = duration / wheel.upTime;
				wheel.angleDelta = wheel.maxSpeed
						* Math.sin(progress * Math.PI / 2);
			} else {
				progress = duration / wheel.downTime;
				wheel.angleDelta = wheel.maxSpeed
						* Math.sin(progress * Math.PI / 2 + Math.PI / 2);
				if (progress >= 1)
					finished = true;
			}

			wheel.angleCurrent += wheel.angleDelta;
			while (wheel.angleCurrent >= Math.PI * 2)
				// Keep the angle in a reasonable range
				wheel.angleCurrent -= Math.PI * 2;

			if (finished) {
				clearInterval(wheel.timerHandle);
				wheel.timerHandle = 0;
				wheel.angleDelta = 0;

				/* $("#counter").html((wheel.frames / duration * 1000) + " FPS"); //밑에 text 주석처리 */
				alert(wheel.segments[i], centerX + size + 25, centerY + "이 당첨되었습니다");
				//$("#counter").html("당첨된 항목은 마이페이지에서 확인하세요");
				location.href="roulet.et?gain="+wheel.segments[i], centerX + size + 25, centerY;
				
			}
			
			/*
			// Display RPM
			var rpm = (wheel.angleDelta * (1000 / wheel.timerDelay) * 60) / (Math.PI * 2);
			$("#counter").html( Math.round(rpm) + " RPM" );
			 */
		},

		init : function(optionList) {
			try {
				wheel.initWheel();
				wheel.initAudio();
				wheel.initCanvas();
				wheel.draw();

				$.extend(wheel, optionList);

			} catch (exceptionData) {
				alert('Wheel is not loaded ' + exceptionData);
			}

		},

		initAudio : function() {
			var sound = document.createElement('audio');
			sound.setAttribute('src', 'wheel.mp3');
			wheel.sound = sound;
		},

		initCanvas : function() {
			var canvas = $('#wheel #canvas').get(0);

			if ($.browser.msie) {
				canvas = document.createElement('canvas');
				$(canvas).attr('width', 800).attr('height', 600).attr('id', 'canvas').appendTo('.wheel');
				canvas = G_vmlCanvasManager.initElement(canvas);
			}

			canvas.addEventListener("click", wheel.spin, false);
			wheel.canvasContext = canvas.getContext("2d");
		},

		initWheel : function() {
			shuffle(wheel.colors);
		},

		// Called when segments have changed
		update : function() {
			// Ensure we start mid way on a item
			var r = Math.floor(Math.random() * wheel.segments.length);
			var r = 0;
			wheel.angleCurrent = ((r + 0.5) / wheel.segments.length) * Math.PI * 2;

			var segments = wheel.segments;
			var len      = segments.length;
			var colors   = wheel.colors;
			var colorLen = colors.length;

			// Generate a color cache (so we have consistant coloring)
			var seg_color = new Array();
			for (var i = 0; i < len; i++)
				seg_color.push( colors [ segments[i].hashCode().mod(colorLen) ] );

			wheel.seg_color = seg_color;

			wheel.draw();
		},

		draw : function() {
			wheel.clear();
			wheel.drawWheel();
			wheel.drawNeedle();
		},

		clear : function() {
			var ctx = wheel.canvasContext;
			ctx.clearRect(0, 0, 1000, 800);
		},

		drawNeedle : function() {
			var ctx = wheel.canvasContext;
			var centerX = wheel.centerX;
			var centerY = wheel.centerY;
			var size = wheel.size;

			ctx.lineWidth = 1;
			ctx.strokeStyle = '#000000';
			ctx.fileStyle = '#ffffff';

			ctx.beginPath();

			ctx.moveTo(centerX + size - 40, centerY);
			ctx.lineTo(centerX + size + 20, centerY - 10);
			ctx.lineTo(centerX + size + 20, centerY + 10);
			ctx.closePath();

			ctx.stroke();
			ctx.fill();

			// Which segment is being pointed to?
			var i = wheel.segments.length - Math.floor((wheel.angleCurrent / (Math.PI * 2))	* wheel.segments.length) - 1;

			// Now draw the winning name
			ctx.textAlign = "left";
			ctx.textBaseline = "middle";
			ctx.fillStyle = '#D2001A'; //화살표 색
			ctx.font = "1.2em Arial"; //화살표 글자 크기
			//ctx.fillText(wheel.segments[i], centerX + size + 25, centerY);
			
			
		},

		drawSegment : function(key, lastAngle, angle) {
			var ctx = wheel.canvasContext;
			var centerX = wheel.centerX;
			var centerY = wheel.centerY;
			var size = wheel.size;

			var segments = wheel.segments;
			var len = wheel.segments.length;
			var colors = wheel.seg_color;

			var value = segments[key];
		
			
			ctx.save();
			ctx.beginPath();

			// Start in the centre
			ctx.moveTo(centerX, centerY);
			ctx.arc(centerX, centerY, size, lastAngle, angle, false); // Draw a arc around the edge
			ctx.lineTo(centerX, centerY); // Now draw a line back to the centre

			// Clip anything that follows to this area
			//ctx.clip(); // It would be best to clip, but we can double performance without it
			ctx.closePath();

			ctx.fillStyle = colors[key];
			ctx.fill();
			ctx.stroke();

			// Now draw the text
			ctx.save(); // The save ensures this works on Android devices
			ctx.translate(centerX, centerY);
			ctx.rotate((lastAngle + angle) / 2);

			ctx.fillStyle = '#FFFFFF'; //룰렛 속 글자색
			ctx.fillText(value.substr(0, 20), size / 2 + 20, 0);
			
			
			
			ctx.restore();

			ctx.restore();
		},

		drawWheel : function() {
			var ctx = wheel.canvasContext;

			var angleCurrent = wheel.angleCurrent;
			var lastAngle    = angleCurrent;

			var segments  = wheel.segments;
			var len       = wheel.segments.length;
			var colors    = wheel.colors;
			var colorsLen = wheel.colors.length;

			var centerX = wheel.centerX;
			var centerY = wheel.centerY;
			var size    = wheel.size;

			var PI2 = Math.PI * 2;

			ctx.lineWidth    = 1;
			ctx.strokeStyle  = '#FFFFFF'; //룰렛 속 구분선
			ctx.textBaseline = "middle";
			ctx.textAlign    = "center";
			ctx.font         = "1.2em Arial"; //룰렛 속 글자 크기

			for (var i = 1; i <= len; i++) {
				var angle = PI2 * (i / len) + angleCurrent;
				wheel.drawSegment(i - 1, lastAngle, angle);
				lastAngle = angle;
			}
			// Draw a center circle
			ctx.beginPath();
			ctx.arc(centerX, centerY, 20, 0, PI2, false);
			ctx.closePath();

			ctx.fillStyle   = '#FFFFFF'; //안에 동그라미 색
			ctx.strokeStyle = '#FFFFFF'; //동그라미 테두리
			ctx.fill();
			ctx.stroke();

			// Draw outer circle
			ctx.beginPath();
			ctx.arc(centerX, centerY, size, 0, PI2, false);
			ctx.closePath();

			ctx.lineWidth   = 8;
			ctx.strokeStyle = '#D2001A'; //룰렛 겉테두리 색
			ctx.stroke();
		},
		
		
	}

///
	window.onload = function() {
		wheel.init();

		var segments = new Array();
		$.each($('#venues input:checked'), function(key, cbox) {
			segments.push( cbox.value );
		});
		
		wheel.segments = segments;
		wheel.update();
	}
	
	
</script>
<style type="text/css">
.card {
	width: 70%;
	align-content: center;
	text-align: center;
	margin: auto;
	right:2ex;
}

#wheel {
	margin-left: 180px;
	display: inline-block;
	text-align: center;
	align-content: center;
}

canvas {
	display: inline-block;
	align-content: center;
	text-align: center;
	margin: auto;
	right: 1ex;
}
</style>

</head>
<div id=venues style="display: none;">
	<ul />
</div><br><br><br><br><br><br>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/이벤트.png" style="width:350px; height:100px"><br>
          </div>
        </div>
      </div>
</div>	
<div class="card border-primary mb-3">
	<div class="card-body">
		<h4 class="card-title">룰렛을 돌리고 포인트가 당첨되면 마이페이지에서 확인 가능합니다.</h4>
		
		<div class="card bg-secondary mb-3">
			<div id=wheel align="center">
				<!-- 센터맞춰야됨. -->
				<canvas height=600 id=canvas width="900px" style="margin-right: 500px;"></canvas>
			</div>
		</div>

	</div>
	<input id="button" class="btn btn-outline-primary" type="button" value="목록보기" onclick="location.href='event.et'">
</div>

<div id=stats>
	<div id=counter></div>
</div>

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp"%>
