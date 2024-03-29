<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Number Input Demo</title>
  <!-- Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet@1.7.1/dist/leaflet.css"/>
  <script src="https://cdn.jsdelivr.net/npm/leaflet@1.7.1/dist/leaflet.js"></script>
  
  <style>
    .center {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
     #map { height: 400px; }
  </style>
</head>
<body>
<form action="/location" method="post">
  <div class="form-group">
      <label for="numberInput">Enter Pin-Code:</label>
      <input type="text" class="form-control" id="numberInput" pattern="\d*" maxlength="6" name="pincode" value="${selected}">
    </div>
    <input type="submit" class="btn-success">
    </form>
    <div class="form-group mt-3">
      <div id="disappearingDiv" class="alert alert-info" role="alert" >
        <h6>Country : ${country}</h6>
        <h6>Country code : ${countryCode}</h6>
        <h6>State : ${state}</h6>
        <h6>State District : ${stateDistrict}</h6>
        <h6>Address : ${address}</h6>
        <h6>PinCode : ${pinCode}</h6>
        <input type="hidden" value="${lon}" id="lon">
        <input type="hidden" value="${lat}" id="lat">
      </div>
    </div>
    <h2>Map View</h2>
    <div id="map"></div>

  <!-- Bootstrap JS and jQuery (for handling input events) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <script>
  var lat = document.getElementById('lat').value; // Replace with your latitude
  var lon = document.getElementById('lon').value; // Replace with your longitude

  var map = L.map('map').setView([lat, lon], 12); // Initialize the map with the given coordinates and zoom level

  // Add a tile layer from OpenStreetMap
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
      maxZoom: 18
  }).addTo(map);

  // Add a marker to the map at the given coordinates
  L.marker([lat, lon]).addTo(map)
      .bindPopup('Your Location'); // You can customize the popup message if needed
  </script>
</body>
</html>