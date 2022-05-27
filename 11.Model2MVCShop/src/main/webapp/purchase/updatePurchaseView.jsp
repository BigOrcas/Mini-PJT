<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>��ǰ����</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">


<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">


<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>

<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">



<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 30px;
        }
    </style>
	<script type="text/javascript">
	
	
function fncUpdatePurchase() {
	
	
	$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase?tranNo=${purchase.tranNo }").submit();
	
}


	

///*
$(function() {
	
	$("button.btn-primary").click(function(){
		console.log('����');
		fncUpdatePurchase();
		
	});
	
	
	$( "button:contains('Ȯ��')" ).on("click" , function() {
		
		 self.location = "/product/listProduct?menu=search"
		});
	
});
//*/
$(function() {
			$('#divyDate').datepicker({
				dateFormat: "yy-mm-dd"
			});
		});
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
		<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-defualt text-center">������������</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="buyerId"  value="${purchase.buyer.userId}" readonly>
		      <input type="hidden" name="buyerId" value="${purchase.buyer.userId}">
		    </div>
		  </div>
		  
			  
		  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone }">
		    </div>
		  </div>
		  
		     <div class="form-group">
		    <label for="buyNum" class="col-sm-offset-1 col-sm-3 control-label">���ż���</label>
		    <div class="col-sm-4">
		      <input type="number" min="0" class="form-control" id="buy" name="buy" value="${purchase.buy }" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    <div class="col-sm-4">		    
<input type="text" id="divyAddr" name="divyAddr" value="${user.addr}">
<input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�"><br>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bdc66313a731d6cd370ddce26735db6a&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // ������ ǥ���� div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
            level: 5 // ������ Ȯ�� ����
        };

    //������ �̸� ����
    var map = new daum.maps.Map(mapContainer, mapOption);
    //�ּ�-��ǥ ��ȯ ��ü�� ����
    var geocoder = new daum.maps.services.Geocoder();
    //��Ŀ�� �̸� ����
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // ���� �ּ� ����

                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("divyAddr").value = addr;
                // �ּҷ� �� ������ �˻�
                geocoder.addressSearch(data.address, function(results, status) {
                    // ���������� �˻��� �Ϸ������
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //ù��° ����� ���� Ȱ��

                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // ������ �����ش�.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // ���� �߽��� �����Ѵ�.
                        map.setCenter(coords);
                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
		    </div>
		  </div>
		  	  
		  	  
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">
		      <select 	name="paymentOption"		class="form-control" >
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
			</select>
		    </div>
		  </div> 
		  	  
		  	  
		  	  
		  <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest"  value="${purchase.divyRequest }" >
		    </div>
		  </div>
		  
		  	 
		  
		
		  
		  
		       <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate" value="${purchase.divyDate }">
		    </div>
		  </div>
		  
		  
			<div class="row">
	  		<div class="col-md-12 text-center ">
	  	
	  		
	  			<button type="button" class="btn btn-primary">����</button>
	  		
		
			
	  			<button type="button" class="btn btn-default">Ȯ��</button>
			
		
		
				
				
				
	  		</div>
		</div>
		  
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	
</body>

</html>