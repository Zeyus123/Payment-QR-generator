<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet@1.7.1/dist/leaflet.css"/>
  <script src="https://cdn.jsdelivr.net/npm/leaflet@1.7.1/dist/leaflet.js"></script>
    <title>Mobile Phone Interface</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        #phone {
            width: 300px;
            height:530px;
            border: 5px solid #333;
            border-radius: 30px;
            margin: 1px auto;
            position: relative;
            overflow: hidden;
        }
        #screen {
            width: 100%;
            height: 100%;
            background-color: #fff;
            overflow: auto;
            padding: 10px;
        }
        #notch{
        margin: auto; /* This will center the div */
 		 width: 40px; /* Adjust width based on content */
  		padding: 10px; /* Optional padding */
        background-color: black;
        border: 1px solid black;
        margin-top: -6px;
        border-radius: 20px ;
        }
        
        #navBar{
       margin: auto; /* This will center the div */
 		width: 90px; /* Adjust width based on content */
  		padding: 2px; /* Optional padding */
        background-color: black;
        border: 1px solid black;
        border-radius: 20px ;
        margin-top: 330px;
        }
        
        #bt{
         margin: auto;
         width: 70px;
         padding-top:5px;
        }
        h2{
        mrgin-left:30px;
        }
        img{
         margin: auto;
         width: 100px;
         padding-top:35px;
        }
        
    </style>
</head>
<body>
    <div id="phone">
        <div id="screen">
        	<div id="notch"></div>
        	<h2>QR</h2>
            <img src="data:image/png;base64,${qrCodeBytes}" alt="QR Code">
            <nav id="navBar"></nav>
        </div>
        
    </div>
</body>
</html>

