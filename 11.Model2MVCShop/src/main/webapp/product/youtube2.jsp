<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
 <html lang="ko">
  <head>
   <meta charset="UTF-8">
    <title>infinity horizon slider</title>
     <style type="text/css">
      *{margin: 0; padding: 0; list-style: none;} 
      #slideWrap { width: 1000px; height: 1000px; border: 5px solid black; overflow: hidden; position: relative; } 
      #slider { height: 100%; background-color: #ffffff; position: absolute;} 
      #slider ul { display: inline; } 
      #slider li { float: left; width: 1000px; height: 1000px;} 
      </style> 
      </head> 
      <body>
       <div id="slideWrap">
        <ul id="slider"> 
        <li><a href="#"><img src="/images/16.JPG" alt="슬라이드1"></a></li> 
        <li><a href="#"><img src="/images/10.JPG" alt="슬라이드2"></a></li>
         <li><a href="#"><img src="/images/18.JPG" alt="슬라이드3"></a></li> 
         </ul> 
         </div> 
         <script>
         //자동 스크롤 애니메이션 
         var ul = document.querySelector('#slider') 
         var slideNumber = document.querySelector('#slider').childElementCount 
         var li = document.querySelector('#slider>li') 
         var firstItemClone = ul.firstElementChild.cloneNode(true); 
         ul.appendChild(firstItemClone); 
         ul.style.width = (slideNumber + 1) * 300 + 'px' 
         function move(){ 
        	 var i = 0;
        	 setInterval(function(){ 
        		 ul.style.transition = '0.2s';
        		 ul.style.transform = 'translate3d(-'+300*(i+1)+'px, 0px, 0px)';
        		 i++;
        		 if (i == slideNumber){
        			 setTimeout(function(){ ul.style.transition = '0s';
        			 ul.style.transform = "translate3d(0px, 0px, 0px)"; },201)
        			 i = 0;
        			 } 
        		 },3000);
        	 } 
         document.addEventListener("DOMContentLoaded",function(){
        	 move(); 
        	 }); 
         </script>
         
          </body> 
          </html>

