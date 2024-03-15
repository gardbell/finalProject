<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>schedule</title>
<style>
table{
	margin: 10px auto;
	clear: both;
}
#month{
	margin: 0px auto;
}
table td{
	border-top: 1px solid gray;
	width: 100px;
	height: 100px;
}
.sunday{
	color: red;
}
.monthday{

}
.tuesday{

}
.wednesday{

}
.thursday{

}
.friday{

}
.saturday{
	color: blue;
}
#tdver{
	position: relative;
    top: -42px;
}
.weekName-div{
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

.custom-select {
    display: inline-block;
    padding: 5px 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
    cursor: pointer;
}
</style>
<script>
var now = new Date();
var year=0;
var criyear=now.getFullYear();
var month=0;
var days=["sunday","monthday","tuesday","wednesday","thursday","friday","saturday"];
var firstDay=0;;
var count=0;
var lastDate=0;
var row=0;
function callCal(pyear,pmonth){
	if(pyear!=0&&pmonth!=0){
		now = new Date(pyear,pmonth,1);
	}else if(pyear!=0&&pmonth==0){
		now = new Date(pyear,month,1);
	}else if(pyear==0&&pmonth!=0){
		now = new Date(year,pmonth,1);
	}
	getRow();
	createCal();
	getTop();
}
function getRow(){
	year=now.getFullYear();
	month=now.getMonth();
	firstDay = new Date(year,month,1).getDay();
	count = firstDay;
	lastDate = new Date(year,month+1,0).getDate();
	for(var i=1;i<=lastDate;i++){
		if(count==6){
			count=-1;
			row+=1;
		}else if(i==lastDate){
			row+=1;
		}
		count+=1;
	}
}
function createCal(){
	count=1;
	var tableNode=document.getElementById('calendar');
	for(var j=1;j<=row;j++){
		var trNode=document.createElement('tr');
		for(var i=0;i<=6;i++){
			if(count==1&&firstDay!=0){
				var voidTdNode=document.createElement('td');
				voidTdNode.setAttribute('colspan',firstDay);
				voidTdNode.setAttribute('class','voidTdNode');
				trNode.appendChild(voidTdNode);
				i=firstDay;
			}
			var tdNode=document.createElement('td');
			var tdDivNode=document.createElement('div');
			tdDivNode.setAttribute('class',days[i]);
			tdDivNode.setAttribute('id','tdver');
			var tdDateText=document.createTextNode(count);
			tdDivNode.appendChild(tdDateText);
			tdNode.appendChild(tdDivNode);
			var tdListNode=document.createElement('div');
			tdNode.appendChild(tdListNode);
			trNode.appendChild(tdNode);
			if(count==lastDate&&firstDay!=6){
				var voidTdNode=document.createElement('td');
				voidTdNode.setAttribute('colspan',6-i);
				voidTdNode.setAttribute('class','voidTdNode');
				trNode.appendChild(voidTdNode);
				i=7;
			}
			count+=1;
		}
		tableNode.appendChild(trNode);
	}
}
function getTop(){
	var hDiv=document.getElementById('month');
	hDiv.setAttribute('style','text-align:center;')
	var hyear=hDiv.firstChild;
	var hmonth=hDiv.lastChild;
	var hySelect=document.createElement('select');
	hySelect.setAttribute('class','custom-select');
	for(var i=criyear-20;i<=criyear+20;i++){
		var opNode=document.createElement('option');
		opNode.setAttribute('value',i);
		opNode.setAttribute('onchange','createCal');
	}
	
	
	
	
	
	
	
	
	hyear.appendChild(hyText);
	var hText=document.createTextNode('\u00A0\u00A0\u00A0\u00A0'+month+'\u00A0\u00A0\u00A0\u00A0');
	var hlp=document.createElement('span');
	var hl=document.createTextNode('<');
	hlp.appendChild(hl);
	var hrp=document.createElement('span');
	var hr=document.createTextNode('>');
	hrp.appendChild(hr);
	hmonth.appendChild(hlp);
	hmonth.appendChild(hText);
	hmonth.appendChild(hrp);
	hDiv.appendChild(hmonth);
}
</script>
</head>
<body onload="javascript:callCal(0,0)">
<h1>캘린더</h1>
<div id="month"><div></div><h1></h1></div>
<div style="margin: 0px auto; width: 700px;">
	<div class="weekName-div"><label class="sunday">sun</label></div>
	<div class="weekName-div"><label class="monthday">mon</label></div>
	<div class="weekName-div"><label class="tuesday">tue</label></div>
	<div class="weekName-div"><label class="wednesday">wed</label></div>
	<div class="weekName-div"><label class="thursday">thu</label></div>
	<div class="weekName-div"><label class="friday">fri</label></div>
	<div class="weekName-div"><label class="saturday">sat</label></div>
</div>
<table id="calendar" cellspacing="0">
</table>
<div class="custom-select">
    <select>
        <option value="1">옵션 1</option>
        <option value="2">옵션 2</option>
        <option value="3">옵션 3</option>
    </select>
</div>
</body>
</html>