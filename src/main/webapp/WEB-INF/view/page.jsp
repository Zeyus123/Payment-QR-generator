<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        
    </style>
</head>
<body>
    <div id="phone">
        <div id="screen">
        	<div id="notch"></div>
            <!-- Your mobile phone screen content here -->
            <h2>Generate QR</h2>
            <form action="/generateQRCode" method="post">
			  <div class="form-group">
			      <input type="text" class="form-control" id="numberInput" name="amount" placeholder="Enter amount" >
			    </div>
			    <div id="bt">
			    <input type="submit" class="btn-success">
			    </div>
			 </form>
			 <c:if test="${qrCodeBytes ne null}">
			 <h6 style="color:red;">click the QR to download</h6>
				<div style="border: 1px solid; display: flex; justify-content: center;">
				    <a href="data:image/png;base64,${qrCodeBytes}" download="QR_Code.png">
				        <img src="data:image/png;base64,${qrCodeBytes}" alt="QR Code">
				    </a>
				    
				</div>
				<h3><marquee>Scan the QR to pay ${amount} rupees</marquee></h3>
			</c:if>
            <nav id="navBar"></nav>
        </div>
        
    </div>
</body>
</html>
