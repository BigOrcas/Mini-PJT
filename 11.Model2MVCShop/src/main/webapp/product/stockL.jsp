<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        
        div.thumbnail{
        height:500px;
        width:340px;
        
        }
        
        
       
    </style>
    
        <style>
	.page-header.text-info {font-family: 'Gowun Batang', serif; font-weight:bold; color:#75574B}
	.text-info {font-family: 'Gowun Batang', serif; font-weight:bold; color:#75574B}
	.row { font-family: 'Gowun Batang', serif;}
	.table.table-hover.table-striped { font-family: 'Gowun Batang', serif;}
</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
			
		}
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
			fncGetList(1);
			
			
			});
		 });	
		
		
		 
	
		 
	</script>
	
</head>

<body>

	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info" style="color:#75574B;">
	       <c:if test="${param.menu.contains('manage') }">
	       상품 관리
	       </c:if>
	       <c:if test="${param.menu.contains('search') }">
	       상품 목록조회
	       </c:if>
	       </h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>가격</option>
					</select>
				  </div>

	  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		</div>
			
					
			
					

	
		
<div class="container">
	
<div class="row">
	<c:set var="i" value="0" />

<c:if test="${param.menu=='search'}">
<c:forEach var="product" items="${list}">
 <div class="col-sm-6 col-md-4">
 <br/> <br/>
    <div class="thumbnail">
       <c:choose>
				    <c:when test="${product.fileName.contains('/')}">
					    <c:choose>
						<c:when test="${product.fileName.contains('mp4')}">
							<c:forEach var="name" items="${product.fileName.split('/')}">
						<video width="400" height="400" controls autoplay src="/images/uploadFiles/${name}" type="video/mp4"></video>
					</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="name" items="${product.fileName.split('/')[0]}">
								<img src="/images/uploadFiles/${name}" id="image">
							</c:forEach>
						</c:otherwise>
						</c:choose>
				    </c:when>
				    <c:otherwise>
						<img src="/images/uploadFiles/${product.fileName}" class="img-responsive img-rounded" id="image">
					</c:otherwise>
					</c:choose>
		
      <div class="caption">
        <h4 style="color:black;">${product.prodName }</h4>
        <p>${product.price }</p>
        
        
        <c:choose>           
       <c:when test="${product.stock=='0'}">
       <p>품절</p>
         <p><a href="/product/getProduct?menu=search&prodNo=${product.prodNo }" class="btn btn-default" role="button">상세정보</a> 
        
        <a disabled="disabled" class="btn btn-default"  role="button">구매</a></p>
        </c:when>         
        
        <c:when test="${product.cancel=='1' }">
        <p >판매중지</p>
        <p><a href="/product/getProduct?menu=search&prodNo=${product.prodNo }" class="btn btn-default" role="button">상세정보</a> 
        
        <a disabled="disabled" class="btn btn-default"  role="button">구매</a></p>
        </c:when>
        
        <c:otherwise>
        <p><a href="/product/getProduct?menu=search&prodNo=${product.prodNo }" class="btn btn-default" role="button">상세정보</a> 
        <a href="/purchase/addPurchase?menu=search&&prodNo=${product.prodNo }" class="btn btn-default" role="button">구매</a> 
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
				    <c:when test="${product.fileName.contains('/')}">
					    <c:choose>
						<c:when test="${product.fileName.contains('mp4')}">
								<c:forEach var="name" items="${product.fileName.split('/')}">
						<video width="400" height="400" controls autoplay src="/images/uploadFiles/${name}" type="video/mp4"></video>
					</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="name" items="${product.fileName.split('/')[0]}">
								<img src="/images/uploadFiles/${name}" id="image">
							</c:forEach>
						</c:otherwise>
						</c:choose>
				    </c:when>
				    <c:otherwise>
						<img src="/images/uploadFiles/${product.fileName}" class="img-responsive img-rounded" id="image">
					</c:otherwise>
					</c:choose>
      <div class="caption">
        <h4 style="color:black;">${product.prodName }</h4>
        <p>${product.price }</p>
         <c:choose>           
       <c:when test="${product.stock=='0'}">
       <p>품절</p>
<p><a href="/product/getProduct?menu=search&prodNo=${product.prodNo }" class="btn btn-default" role="button" >상세정보</a> 
        <a href="/product/updateProduct?menu=${param.menu}&prodNo=${product.prodNo }" class="btn btn-default" role="button">수정</a>
     </c:when>    
       <c:when test="${product.cancel=='1' }">
        <p >판매중지</p>
   <p><a href="/product/getProduct?menu=search&prodNo=${product.prodNo }" class="btn btn-default" role="button" >상세정보</a> 
        <a href="/product/updateProduct?menu=${param.menu}&prodNo=${product.prodNo }" class="btn btn-default" role="button">수정</a>
        </c:when>
			
	
        
        <c:otherwise>
   <p><a href="/product/getProduct?menu=search&prodNo=${product.prodNo }" class="btn btn-default" role="button" >상세정보</a> 
        <a href="/product/updateProduct?menu=${param.menu}&prodNo=${product.prodNo }" class="btn btn-default" role="button">수정</a>
        </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>		
    </c:forEach>
    </c:if>
    
			

		
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>