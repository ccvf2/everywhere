function toServer() {
      var addr = document.getElementById("addr").value;
      var url = "https://maps.googleapis.com/maps/api/geocode/json";
      var params = "address=" + addr + "&sensor=true";

      sendRequest("GET", url, fromServer, params);
   }

   function fromServer() {
      if (xhr.readyState == 4 && xhr.status == 200) {
         process();
      }
   }

   function process() {
     var obj = JSON.parse(xhr.responseText);
     alert(xhr.responseText);
      var getLat = obj.results[0].geometry.location.lat;
      var getLng = obj.results[0].geometry.location.lng;
      
      var addTitle = obj.results[0].formatted_address;
      var getLatLng = {lat : getLat, lng : getLng};

      var myOptions = {
         zoom : 15,
         center : getLatLng,
         mapTypeId : google.maps.MapTypeId.ROADMAP
      }
      
      //인포윈도우의 생성
      var infowindow = new google.maps.InfoWindow({
         content : addTitle,
         size : new google.maps.Size(50, 50),
         position : getLatLng
      });
      infowindow.open(map);
      
      document.getElementById("address").value = obj.results[0].formatted_address;
      document.getElementById("lat").value =getLat;
      document.getElementById("lng").value =getLng;
   }

   /* ------------------------------------------------------------------------------------- */
   var marker;
   var map;
   function initialize() {      
      var myLatlng = new google.maps.LatLng(37.564615, 126.98420299999998);
      var myOptions = {
         zoom : 19,
         center : myLatlng,
         mapTypeId : google.maps.MapTypeId.ROADMAP
      }
      var geocoder = new google.maps.Geocoder();
      
      map = new google.maps.Map(document.getElementById("map"), myOptions);
      
      var fullAddress;
      //클릭했을 때 이벤트
      google.maps.event.addListener(map, 'click', function(event) {
         //geocoder를 사용하기 위해 변수를 선언하고 구글 맵 api에서 객체를 얻어 옵니다.
         geocoder.geocode({'latLng' : event.latLng}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
               /* 좌표를 주소로 변환 시키는 geocoder를 실행합니다.
               	* 만약 성공적으로 변환이 되었다면, status라는 상태변수가 참이 되어 아래의 코드들이 실행됩니다.
                */
               if (results[1]) {
            	  
            	 //만약 반환된 결과값이 비어있지 않으면 innerHTML을 이용해 결과값을 출력합니다.
                  fullAddress = results[1].formatted_address;                  
                  document.getElementById("address").value =fullAddress;
                  document.getElementById("lat").value =event.latLng.lat();
                  document.getElementById("lng").value =event.latLng.lng();;
               }
            } else {
               alert("Geocoder failed due to: " + status);//만약 geocoder가 실패시 알림창을 출력합니다.
            }
         });
         
         placeMarker(event.latLng);
         infowindow.setContent(fullAddress); // 인포윈도우 안에 클릭한 곳위 좌표값을 넣는다.
         infowindow.setPosition(event.latLng); // 인포윈도우의 위치를 클릭한 곳으로 변경한다.
      });
      //클릭 했을때 이벤트 끝
      //인포윈도우의 생성
      var infowindow = new google.maps.InfoWindow(
            {
               content : '<br><b>원하는 위치을 클릭</b>하면 좌표값생성<br> <b>복사하여 좌료값 입력</b>하십시요',
               size : new google.maps.Size(50, 50),
               position : myLatlng
            });
      infowindow.open(map);
   } // function initialize() 함수 끝

   // 마커 생성 합수
   function placeMarker(location) {
      var clickedLocation = new google.maps.LatLng(location);

      marker = new google.maps.Marker({
         position : location,
         map : map
      });
      marker.setMap(null);
      map.setCenter(location);
   }
   
   function markInitialize(lat, lng, name) {	  
	   var myLatlng = new google.maps.LatLng(lat, lng);
	   var myOptions = {
			   zoom : 15,
			   center : myLatlng,
			   mapTypeId : google.maps.MapTypeId.ROADMAP
	   }
	   //마커 생성
	   var marker=new google.maps.Marker({
		   position:myLatlng,
	   });
	   map = new google.maps.Map(document.getElementById("map"), myOptions);
	   marker.setMap(map);
	   
	   //인포윈도우의 생성
	   var infowindow = new google.maps.InfoWindow({
		   content : name
	   });
	   infowindow.open(map,marker);
	   google.maps.event.addListener(marker, 'click', function() {
		   infowindow.open(map,marker);
	   });
	   
   }