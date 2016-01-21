function updateAddr(){
	var addr = prompt("검색하실 주소를 입력해 주세요");
	if (addr != null) {
		var url = "https://maps.googleapis.com/maps/api/geocode/json";
		var params = "address=" + addr + "&sensor=true";
		sendRequest("GET", url, fromServer, params);
	}
}

function toServer() {
	var addr = document.getElementById("address").value;
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
	var getLat = obj.results[0].geometry.location.lat;
	var getLng = obj.results[0].geometry.location.lng;

	var addTitle = obj.results[0].formatted_address;
	var getLatLng = {
		lat : getLat,
		lng : getLng
	};

	var myOptions = {
		zoom : 15,
		center : getLatLng,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	}

	// 인포윈도우의 생성
	var infowindow = new google.maps.InfoWindow({
		content : addTitle,
		size : new google.maps.Size(50, 50),
		position : getLatLng
	});
	infowindow.open(map);

	document.getElementById("address").value = obj.results[0].formatted_address;
	document.getElementById("lat").value = getLat;
	document.getElementById("lng").value = getLng;
}

/* ------------------------------------------------------------------------------------- */
var map;
function initialize() {
	var myLatlng = new google.maps.LatLng(37.564615, 126.98420299999998);
	var myOptions = {
		zoom : 15,
		center : myLatlng,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	}
	
	map = new google.maps.Map(document.getElementById("map"), myOptions);
	
	// 클릭했을 때 이벤트
	var fullAddress;
	var geocoder = new google.maps.Geocoder();
	google.maps.event.addListener(map, 'click', function(event) {
		// geocoder를 사용하기 위해 변수를 선언하고 구글 맵 api에서 객체를 얻어 옵니다.
		geocoder.geocode({
			'latLng' : event.latLng
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				/*
				 * 좌표를 주소로 변환 시키는 geocoder를 실행합니다. 만약 성공적으로 변환이 되었다면, status라는
				 * 상태변수가 참이 되어 아래의 코드들이 실행됩니다.
				 */
				if (results[0]) {
					// 만약 반환된 결과값이 비어있지 않으면 innerHTML을 이용해 결과값을 출력합니다.
					//fullAddress = results[1].formatted_address;					
					fullAddress = results[0].formatted_address;					
					document.getElementById("address").value = fullAddress;
					document.getElementById("lat").value = event.latLng.lat();
					document.getElementById("lng").value = event.latLng.lng();
					
					//placeMarker(event.latLng);
					marker.setPosition(event.latLng);
					marker.setMap(map);
					map.setCenter(event.latLng);
					infowindow.close(map);
					
					console.log(results);
				}
			} else {
				alert("Geocoder failed due to: " + status);// 만약 geocoder가 실패시
															// 알림창을 출력합니다.
			}
		});
	});

	// 인포윈도우의 생성
	var infowindow = new google.maps.InfoWindow({
		content : '원하는 위치를 클릭 혹은<br>검색 하십시요',
		size : new google.maps.Size(50, 50),
		position : myLatlng
	});
	infowindow.open(map);
	
	// 마커 생성
	var marker = new google.maps.Marker({
		position : myLatlng,
		map : map
	});
	marker.setMap(null);
	
	$('#addSpotModal').on('show.bs.modal', function() {
		resizeMap();
	})
};


function resizeMap() {
	if(typeof map =="undefined") return;
	setTimeout( function(){resizingMap();} , 400);
}

function resizingMap() {
	if(typeof map =="undefined") return;
	var center = map.getCenter();
	google.maps.event.trigger(map, "resize");
	map.setCenter(center); 
}
/* ------------------------------------------------------------------------------------- */
// spot Read 할때 지도 표시
function markInitialize(lat, lng, name) {
	var myLatlng = new google.maps.LatLng(lat, lng);
	var myOptions = {
		zoom : 15,
		center : myLatlng,
		
		mapTypeId : google.maps.MapTypeId.ROADMAP
	}
	// 마커 생성
	var marker = new google.maps.Marker({
		position : myLatlng,
		animation:google.maps.Animation.BOUNCE
	});
	map = new google.maps.Map(document.getElementById("map"), myOptions);
	marker.setMap(map);
	
	google.maps.event.addListener(map, 'click', function(event) {
		map.setCenter(myLatlng);   // 클릭후에 다시 원래 좌표로 이동
	});
}
