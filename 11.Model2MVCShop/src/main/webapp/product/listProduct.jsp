<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
      <style>

        .bi-heart{
            font-size: 30px;
            line-height: 30px;
            color:crimson;
        }

        .bi-heart-fill{
            font-size: 30px;
            line-height: 30px;
            color:crimson;
        }

    </style>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
div.thumbnail {
	height: 500px;
	width: 340px;
}
</style>


<style>
.page-header.text-info {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: #75574B
}
.text-info {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: #75574B
}
.row {
	font-family: 'Gowun Batang', serif;
}
.table.table-hover.table-striped {
	font-family: 'Gowun Batang', serif;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
			console.log('${param.menu}');
		}
		
		
		$(document).on('click', 'a.btn-defualt', function(){
			 var prodNo =$(this).attr("value");
			 console.log('������');
			 self.location = "/product/getProduct?menu=search&prodNo="+prodNo
		});


		
		/*
			 
			
			var prodNo = $("input[name='prodNo']").val();
			var userId = ${user.userId};
			
			console.log(prodNo);
		     $.ajax({
		            type : "POST",  
		            url : "/heart/json/updateHeart",       
		            dataType : "json",   
		            data : {'prodNo' : prodNo, 'userId' : userId },
		            error : function(){
		               alert("��� ����");
		            },
		            success : function(heartCheck) {
		                
		                    if(heartCheck == 0){
		                    	alert("��õ�Ϸ�.");
		                    	location.reload();
		                    }
		                    else if (heartCheck == 1){
		                     alert("��õ���");
		                    	location.reload();

		                    
		                }
		            }
		        })
		        
		        */
		

		 
	
		
		 
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
			
			 
			$( "p.like_btn" ).on("click" , function(){
				var prodNo = $(this).attr("value");
				var userId = $("input[name='userId']").val();
				
				console.log(prodNo);
				console.log(userId);
			     $.ajax({
			            type : "POST",  
			            url : "/heart/json/updateHeart",       
			            dataType : "json",   
			            data : {'prodNo' : prodNo, 'userId' : userId },
			            error : function(){
			               alert("��� ����");
			            },
			            success : function(heartCheck) {
			                
			                    if(heartCheck == 0){
			                    	alert("��õ�Ϸ�.");
			                    	  $(this).removeClass('bi bi-heart like_btn');
			                          $(this).addClass('bi-heart-fill like_btn');
			                          heartCheck++;
			                    	location.reload();
			                    }
			                    else if (heartCheck == 1){
			                     alert("��õ���");
			                     $(this).removeClass('bi-heart-fill like_btn');
			                     $(this).addClass('bi bi-heart like_btn');
			                     heartCheck--;
			                    	location.reload();

			                    
			                }
			            }
			        })
			 });
				//=====================================================
				$( "button.btn.btn-default:contains('�˻�')" ).on("click" , function() {
					fncGetList(1);
				 
			 });
				
				 $(document).on('click', 'a.btn-defualt', function(){
					 var prodNo =$(this).attr("value");
					 console.log('������');
					 self.location = "/product/getProduct?menu=search&prodNo="+prodNo
				});
				 
				
				 $(document).on('click', 'a.update', function(){
					 var prodNo =$(this).attr("value");
					 console.log('�����ϱ�');
					 self.location = "/product/updateProduct?prodNo="+prodNo
				});
				 
				 $(document).on('click', 'a.buy', function(){
					 var prodNo =$(this).attr("value");
					 console.log('�����ϱ�');
					 self.location = "/product/getProduct?menu=search&prodNo="+prodNo
				});
				
				 //=========autoComplete=================================================
				 
				 var list = [];
			   		<c:forEach var="names" items="${autoproduct }" >
			   		list.push("${names.prodName}");
			   		</c:forEach>
			   		
		   		    
			   		$( "#prodname" ).autocomplete({
			   		      source: list,
			   		      
			   		});
			   		
			   	//====================================================================
			 
			   	 $(window).scroll(function() {
		                if($(window).scrollTop() == $(document).height() - $(window).height()) { 
		                	
		                	var cpage = $("#currentPage").val();
		                	console.log(cpage);
		                	cpage = Number(cpage)+1;
		                	console.log(cpage);
		        	   		
		        	   		
					            $.ajax({
					                
					                  url : "/product/json/listProduct?&menu=${param.menu }" ,
					                  method : "POST" ,
					                  data : JSON.stringify({
					                	  currentPage : cpage
					                  }), 
					                  dataType : "json" ,
					                  headers : {
					                     "Accept" : "application/json",
					                     "Content-Type" : "application/json"
					                  },
					                success : function(JSONData , status) {
					                	 
					                	$("#currentPage").val(cpage)
					                	//console.log(cpage); 
					                	//alert(JSONData.list[0].prodName);
					                	//alert(JSONData.list.length);
					                	console.log(JSONData.list[0].prodName);
						                	 
					                	for(var i=0; i<JSONData.list.length-1; i++){
					                		///*
					                		var image;
					                		var message;
					                		var cancel;
					                		var button;
					                
					                		if(JSONData.list[i].cancel == '0'){
				                				
				                					image = "<img src='/images/uploadFiles/"+JSONData.list[i].fileName.split('/')[0]+"' id='image'>";
				                				
					                			
					                		}else if(JSONData.list[i].cancel == '1'){
					                			
				                					image = "<img src='/images/uploadFiles/"+JSONData.list[i].fileName.split('/')[0]+"' id='image_none'>";
				                				
					                		}
					                		
					                		
					                		if(${user.role.equals('admin') && param.menu.equals('manage')}){
					                			message="<p>���� ��� : "+JSONData.list[i].stock+"</p>";
					                		}else{
					                			message="<p></p>";
					                		}
					                		
					                		
					                		if(JSONData.list[i].cancel == '1' && param.menu.equals('search')){
					                			cancel = "<p style='color:#DB4455'>�Ǹ�����</p>";
					                		}else if(JSONData.list[i].cancel == '1' && param.menu.equals('manage')){
					                			cancel = "<p style='color:#DB4455'>*�Ǹ������� ��ǰ�Դϴ�.</p>";
					                		}else if(JSONData.list[i].cancel == '0'){
					                			cancel = "<p></p>";
					                		}
					                		
					                		if(${param.menu=='manage' }){
					                			button = "<a class='btn btn-defualt btn update'  role='button' value='"+JSONData.list[i].prodNo+"'>�����ϱ�</a>" ;
					                		}else{
					                			if(JSONData.list[i].stock == "0"){
					                				button = "<a class='btn btn-defualt btn disabled' role='button' >������</a>";
					                			}else{
					                				if(JSONData.list[i].cancel=='0'){
					                					button = "<a class='btn btn-default btn buy' role='button' value='"+JSONData.list[i].prodNo+"'>�����ϱ�</a>";
					                				}else{
					                					button = "<a class='btn btn-default btn disabled' role='button' value='"+JSONData.list[i].prodNo+"'>�����ϱ�</a>";
					                				}
					                			}
					                		}
					                		
						                     var displayValue = "<div class='col-sm-6 col-md-4'>"
						                     					+"<div class='thumbnail'>"
						                     					+image
					                     						+"<div class='caption'>"
					                     						+"<h3>"+JSONData.list[i].prodName+"</h3>"
					                     						+cancel
					                     						+"<p>"+JSONData.list[i].price+" ��</p>"
					                     						+"<p align='right'>"
					                     						+"<a class='btn btn-defualt btn'  role='button' value='"+JSONData.list[i].prodNo+"'>������</a>"
					                     						+button
					                     						+"</p>"
					                     						+"</div></div></div>"
					                     						
					                     		//*/				
						               	$( '#scrollList' ).append(displayValue);	
					                     						
					                     						 		
					                    						
					                     						
					                	}//for 
					                 }
					            });//ajax
					           
		                }//if
		            });//function
		 
		   });
		 
	</script>
	
</head>

<body>

	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info" style="color:#75574B;">
	       <c:if test="${param.menu.contains('manage') }">
	       ��ǰ����
	       </c:if>
	       <c:if test="${param.menu.contains('search') }">
	       ��ǰ�����ȸ
	       </c:if>
	       </h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-primary" style="color:black;">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>

			
			<form class="form-inline" name="detailForm">
				<div class="col-md-6 text-right">
					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${!empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>��ǰ��ȣ</option>
							<option value="1"
								${!empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>��ǰ��</option>
							<option value="2"
								${!empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>��ǰ����</option>
						</select>

					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">�˻���</label> <input
							type="text" class="form-control" id="prodname"
							name="searchKeyword" placeholder="�˻���"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
							
					<button type="button" class="btn btn-default">�˻�</button>
					</div>
					
				</div>
	
					
				
					
						<input type="hidden" id="currentPage" name="currentPage" value="1" />
				
		</form>
			
		

					<!-- PageNavigation ���� ������ ���� ������ �κ� -->


		</div>
</div>
	
		
<div class="container">
	
<div class="row">
	<c:set var="i" value="0" />

<c:if test="${param.menu=='search'}">
<c:forEach var="product" items="${list}">
  <input type="hidden" name="userId" value="${user.userId}">
  <input type="hidden" name="heartCheck" value="${heart.heartCheck}">
 <div class="col-sm-6 col-md-4">
 <br/> <br/>
    <div class="thumbnail">
    				<c:choose>
    
     <c:when test="${product.fileName.contains('/')}">
					    <c:choose>
						<c:when test="${product.fileName.contains('mp4')}">
							<c:forEach var="name" items="${product.fileName.split('/')}">
						<video width="200" height="200" controls autoplay src="/images/uploadFiles/${name}" type="video/mp4"></video>
					</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="name" items="${product.fileName.split('/')[0]}">
								<img src="/images/uploadFiles/${name}" id="image" width="200" height="200">
							</c:forEach>
						</c:otherwise>
						</c:choose>
				    </c:when>
		
		<c:otherwise>
		
		<img class="image" src="/images/uploadFiles/${product.fileName}" width="200" height="200"><br/>
		</c:otherwise>
		</c:choose>
		
      <div class="caption">
        <h4 style="color:black;">${product.prodName }</h4>
        <p>${product.price }</p>
        
        <c:choose>
        
        <c:when test="${product.cancel=='1' }">
        <p style="color:red;">�Ǹ�����</p>
        <p><a href="/product/getProduct?menu=search&prodNo=${product.prodNo}" class="btn btn-default" role="button">������</a> 
        
        <a class="btn btn-default" disabled="disabled" role="button">����</a>
                    <p align="right" class="bi bi-heart-fill like_btn"  id="like_btn">${product.hearthit}</p>
                    	 <button class="btn btn-warning like_btn" id="like_btn" >��õ ${product.hearthit}</button>
    <!-- onclick="updateHeart(); return false;" -->
    
    <script>
    
    var heartcheck = $("input[name='heartcheck']").val();
    $('.bi-heart').on('click',function(){
        if(heartcheck==0){
            $(this).removeClass('bi-heart ');
            $(this).addClass('bi-heart-fill');
            heartcheck++;
        }else if(heartcheck==1){
            $(this).removeClass('bi-heart-fill');
            $(this).addClass('bi-heart');
            heartcheck--;
        }
        
    });

</script>
        
        
       
        </c:when>
        
        <c:otherwise>
          <input type="hidden" name="heartCheck" value="${heart.heartCheck}">
        <p><a href="/product/getProduct?menu=search&prodNo=${product.prodNo }" class="btn btn-default" role="button">������</a> 
        <a href="/purchase/addPurchase?menu=search&&prodNo=${product.prodNo }" class="btn btn-default" role="button">����</a> 
         <p align="right" class="bi bi-heart like_btn" value="${product.prodNo}" name="heartCheck">  ${heart.heartCheck}    ${product.hearthit}</p>
                    	
        
            <script>
    
    var heartCheck = $("input[name='heartCheck']").val();
    $('p.like_btn').on('click',function(){
        if(heartCheck==0){
            $(this).removeClass('bi bi-heart like_btn');
            $(this).addClass('bi-heart-fill');
            heartCheck++;
        }else if(heartCheck==1){
            $(this).removeClass('bi-heart-fill');
            $(this).addClass('bi bi-heart like_btn');
            heartCheck--;
        }
        
    });

</script>
          
           
    <!-- 
    <script>
    var i = 0;
    $('.bi-heart').on('click',function(){
        if(i==0){
            $(this).removeClass('bi-heart');
            $(this).addClass('bi-heart-fill');
            i++;
        }else if(i==1){
            $(this).removeClass('bi-heart-fill');
            $(this).addClass('bi-heart');
            i--;
        }
        
    });
    
    

</script>
        
  -->      
        </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>		
    </c:forEach>
    </c:if>
    
<c:if test="${param.menu=='manage'}">
    <c:forEach var="product" items="${list}">
    
 <div class="col-sm-6 col-md-4">
 <br/> <br/>
    <div class="thumbnail">
     <c:choose>
    
    	<c:when test="${(product.fileName).contains('/')}">
    		<c:forEach var="name" items="${(product.fileName).split('/')[0]}">
		<img src="/images/uploadFiles/${name}" width="200" height="200"><br/>
			</c:forEach>
		
      </c:when>                                                                                                                           
		
		<c:otherwise>
		<img src="/images/uploadFiles/${product.fileName}" width="200" height="200"><br/>
		</c:otherwise>
		</c:choose>
      <div class="caption">
        <h4 style="color:black;">${product.prodName }</h4>
        <p>${product.price }</p>
        <c:if test="${product.cancel=='1' }">
        <p style="color:red;">�Ǹ�����</p>
        </c:if>
        <p><a href="/product/getProduct?menu=manage&prodNo=${product.prodNo }" class="btn btn-default" role="button" >������</a> 
        <a href="/product/updateProduct?menu=${param.menu}&prodNo=${product.prodNo }" class="btn btn-default" role="button">����</a>
       
      </div>
    </div>
  </div>		
    </c:forEach>
    </c:if>
    
              <div  id="scrollList"></div>
    
  </div>
		
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<!-- PageNavigation End... -->
	
</body>

</html>