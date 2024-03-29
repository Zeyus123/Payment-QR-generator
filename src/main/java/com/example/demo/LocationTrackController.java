package com.example.demo;

import java.io.ByteArrayOutputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

@Controller
public class LocationTrackController {
	
	 private final RestTemplate restTemplate;

	    public LocationTrackController(RestTemplate restTemplate) {
	        this.restTemplate = restTemplate;
	    }

	@GetMapping("/getLocation")
	public String view() {
		return "page";
	}
	
	@PostMapping("/location")
    public String getLocation( String pincode , Model model) {
		String url = "https://nominatim.openstreetmap.org/search?q=" + pincode + "&format=json&addressdetails=1";
        try {
        	LocationData[] locationData = restTemplate.getForObject(url, LocationData[].class);

            if (locationData != null && locationData.length > 0) {
                LocationData location = locationData[0];
                model.addAttribute("selected", pincode);
                model.addAttribute("pinCode", location.getName());
                model.addAttribute("address", location.getDisplayName());
                model.addAttribute("country", location.getAddress().getCountry());
                model.addAttribute("stateDistrict", location.getAddress().getStateDistrict());
                model.addAttribute("state", location.getAddress().getState());
                model.addAttribute("countryCode", location.getAddress().getCountryCode());
                model.addAttribute("lon", location.getLon());
                model.addAttribute("lat", location.getLat());
            } else {
                // Handle no data found
            }            
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "map";
        
        
    }
	
	@PostMapping("/generateQRCode")
	public String generateQRCode(String amount, RedirectAttributes model) {
	    // Generate QR code with payment request details
	    try {
	        // Construct the content of the QR code (e.g., UPI payment URL)
	        String qrCodeContent = generateUpiUrl(amount);
	        System.out.println();
	        // Generate QR code
	        Map<EncodeHintType, Object> hintMap = new HashMap<>();
	        hintMap.put(EncodeHintType.MARGIN, 0);
	        QRCodeWriter qrCodeWriter = new QRCodeWriter();
	        BitMatrix bitMatrix = qrCodeWriter.encode(qrCodeContent, BarcodeFormat.QR_CODE, 100, 100, hintMap);

	        // Convert bit matrix to image
	        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
	        MatrixToImageWriter.writeToStream(bitMatrix, "PNG", byteArrayOutputStream);
	        byte[] byteArray = byteArrayOutputStream.toByteArray();
	        String base64Image = java.util.Base64.getEncoder().encodeToString(byteArray);
	        
	        // Pass the base64 encoded image data to the view
	        model.addFlashAttribute("qrCodeBytes", base64Image);
	        model.addFlashAttribute("amount", amount);
	    } catch (Exception e) {
	        e.printStackTrace();
	        // Handle exceptions
	    }

	    return "redirect:/getLocation"; // Assuming "qr" is the name of your view
	}
	
	// Method to generate UPI payment URL for a specific amount
	private String generateUpiUrl(String amount) {
	    // Assuming a basic UPI payment URL format
	    // Modify this based on your specific requirements
	    String recipientVpa = "7735587660@ybl"; // Replace with the recipient's VPA
	    String currency = "INR"; // Assuming the currency is INR (Indian Rupees)
	    String transactionNote = "Payment"; // Transaction note (optional)
	    
	    // Construct the UPI payment URL
	    StringBuilder urlBuilder = new StringBuilder();
	    urlBuilder.append("upi://pay?");
	    
	    // Add recipient VPA
	    urlBuilder.append("pa=");
	    urlBuilder.append(recipientVpa);
	    
	    // Add payment amount
	    urlBuilder.append("&am=");
	    urlBuilder.append(amount);
	    
	    // Add currency
	    urlBuilder.append("&cu=");
	    urlBuilder.append(currency);
	    
	    // Add transaction note (optional)
	    if (transactionNote != null && !transactionNote.isEmpty()) {
	        urlBuilder.append("&tn=");
	        urlBuilder.append(URLEncoder.encode(transactionNote, StandardCharsets.UTF_8));
	    }
	    
	    return urlBuilder.toString();
	}


}
