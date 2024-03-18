<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>schedule</title>
<style>
table {
	margin: 10px auto;
	clear: both;
}

#month {
	margin: 0px auto;
}

table td {
	border-top: 1px solid gray;
	width: 100px;
	height: 100px;
}

.sunday {
	color: red;
}

.monthday {
	
}

.tuesday {
	
}

.wednesday {
	
}

.thursday {
	
}

.friday {
	
}

.saturday {
	color: blue;
}

#tdver {
	position: relative;
	top: -42px;
}

.weekName-div {
	text-align: center;
	width: 100px;
	display: inline;
	float: left;
}

select {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background-color: transparent;
	border: none;
	outline: none;
}

.year-select {
	display: inline-block;
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #fff;
	cursor: pointer;
}

.month-select {
	font-size: 35px;
	text-align: center;
	display: inline-block;
	padding: 10px 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #fff;
	margin-left: 30px;
	margin-right: 30px;
	cursor: pointer;
	position: relative;
}

input[type="button"] {
	width: 35px;
	height: 50px;
	border: none;
	font-size: 35px;
	background-color: #ffffff;
}
#on_art {
	position: absolute;
	top: 0;
	left: 0;
	height: 140vh;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: none;
	z-index: 999;
	align-items: center;
    justify-content: center;
}
#schedule_form{
	text-align: center;
	background-color: white;
	width: 350px;
	height: 500px;
}
</style>
<script>
	var now = new Date();
	var year = 0;
	var criyear = now.getFullYear();
	var month = 0;
	var days = [ "sunday", "monthday", "tuesday", "wednesday", "thursday",
			"friday", "saturday" ];
	var firstDay = 0;
	var count = 0;
	var lastDate = 0;
	var row = 0;
	function callCal(pyear, pmonth) {
		row = 0;
		if (pyear != 0 || pmonth != 0) {
			now = new Date(pyear, pmonth, 1);
		}
		getRow();
		getTop();
		createCal();
	}
	function getRow() {
		year = now.getFullYear();
		month = now.getMonth();
		lastDate = new Date(year, (month + 1), 0).getDate();
		firstDay = new Date(year, month, 1).getDay();

		count = firstDay;
		for (var i = 1; i <= lastDate; i++) {
			if (count == 6) {
				count = -1;
				row += 1;
			} else if (i == lastDate) {
				row += 1;
			}
			count += 1;
		}
	}
	function createCal() {
		count = 1;
		var tableNode = document.getElementById('calendar');
		tableNode.innerHTML = "";
		for (var j = 1; j <= row; j++) {
			var trNode = document.createElement('tr');
			for (var i = 0; i <= 6; i++) {
				if (count == 1 && firstDay != 0) {
					var voidTdNode = document.createElement('td');
					voidTdNode.setAttribute('colspan', firstDay);
					voidTdNode.setAttribute('class', 'voidTdNode');
					trNode.appendChild(voidTdNode);
					i = firstDay;
				}
				var tdNode = document.createElement('td');
				tdNode.setAttribute('onclick','showOnArt('+year+','+month+','+date+')');
				var tdDivNode = document.createElement('div');
				tdDivNode.setAttribute('class', days[i]);
				tdDivNode.setAttribute('id', 'tdver');
				var tdDateText = document.createTextNode(count);
				tdDivNode.appendChild(tdDateText);
				tdNode.appendChild(tdDivNode);
				var tdListNode = document.createElement('div');
				tdNode.appendChild(tdListNode);
				trNode.appendChild(tdNode);
				if (count == lastDate && i != 6) {
					var voidTdNode = document.createElement('td');
					voidTdNode.setAttribute('colspan', 6 - i);
					voidTdNode.setAttribute('class', 'voidTdNode');
					trNode.appendChild(voidTdNode);
					i = 7;
				}
				count += 1;
			}
			tableNode.appendChild(trNode);
		}
	}
	function getTop() {
		var hDiv = document.getElementById('month');
		hDiv.setAttribute('style', 'text-align:center;')
		getYear(hDiv);
		getMonth(hDiv);
	}
	function getYear(hDiv) {
		var hyear = hDiv.firstChild;
		hyear.innerHTML = "";
		var hySelect = document.createElement('select');
		hySelect.setAttribute('class', 'year-select');

		for (var i = criyear - 20; i <= criyear + 20; i++) {
			var opNode = document.createElement('option');
			opNode.setAttribute('value', i);
			if (i == year) {
				opNode.setAttribute('selected', 'selected');
			}
			opNode.innerHTML = i;
			hySelect.appendChild(opNode);
		}
		hySelect.setAttribute('onchange', 'callCal(this.value,' + month + ')');
		hyear.appendChild(hySelect);
	}
	function getMonth(hDiv) {
		var hmonth = hDiv.lastChild;
		hmonth.innerHTML = "";
		var hText = document.createElement('select');
		hText.setAttribute('class', 'month-select');
		for (var i = 0; i <= 11; i++) {
			var opNode = document.createElement('option');
			opNode.setAttribute('value', i);
			if (i == month) {
				opNode.setAttribute('selected', 'selected');
			}
			opNode.innerHTML = i + 1;
			hText.appendChild(opNode);
		}
		hText.setAttribute('onchange', 'callCal(' + year + ',this.value)');
		var hlp = document.createElement('input');
		hlp.setAttribute('type', 'button');
		hlp.setAttribute('value', '<');
		hlp
				.setAttribute('onclick', 'callCal(' + year + ',' + (month - 1)
						+ ')');
		var hrp = document.createElement('input');
		hrp.setAttribute('type', 'button');
		hrp.setAttribute('value', '>');
		hrp
				.setAttribute('onclick', 'callCal(' + year + ',' + (month + 1)
						+ ')');
		hmonth.appendChild(hlp);
		hmonth.appendChild(hText);
		hmonth.appendChild(hrp);
		hDiv.appendChild(hmonth);
	}
	function showOnArt(year,month,date) {
		
		
		
		
		
		
		
	    document.getElementById("on_art").style.display = "flex";
	}

	function hideOnArt() {
	    document.getElementById("on_art").style.display = "none";
	}
	
</script>
</head>
<body onload="javascript:callCal(0,0)">
	<section>
		<article id="under_art">
			<a href="javascript:showOnArt()">띄우기</a>
			<h1>캘린더</h1>
			<div id="month">
				<div></div>
				<h1></h1>
			</div>
			<div style="margin: 0px auto; width: 700px;">
				<div class="weekName-div">
					<label class="sunday">sun</label>
				</div>
				<div class="weekName-div">
					<label class="monthday">mon</label>
				</div>
				<div class="weekName-div">
					<label class="tuesday">tue</label>
				</div>
				<div class="weekName-div">
					<label class="wednesday">wed</label>
				</div>
				<div class="weekName-div">
					<label class="thursday">thu</label>
				</div>
				<div class="weekName-div">
					<label class="friday">fri</label>
				</div>
				<div class="weekName-div">
					<label class="saturday">sat</label>
				</div>
			</div>
			<table id="calendar" cellspacing="0">
			</table>
		</article>
		<article id="on_art">
			<div id="schedule_form">
			
				<a href="javascript:hideOnArt()">닫기</a>
			</div>
		</article>
	</section>
</body>
</html>