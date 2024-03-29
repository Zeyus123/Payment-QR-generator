package com.example.demo;


import com.fasterxml.jackson.annotation.JsonProperty;

public class LocationData {
    @JsonProperty("name")
    private String name;
    
    @JsonProperty("address")
    private AddressDTO address;
    
    private String lat;
    
    private String lon;

    public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}

	public AddressDTO getAddress() {
		return address;
	}

	public void setAddress(AddressDTO address) {
		this.address = address;
	}

	@JsonProperty("display_name")
    private String displayName;

    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getStateDistrict() {
		return stateDistrict;
	}

	public void setStateDistrict(String stateDistrict) {
		this.stateDistrict = stateDistrict;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	@JsonProperty("country")
    private String country;

    @JsonProperty("state_district")
    private String stateDistrict;

    @JsonProperty("state")
    private String state;

    @JsonProperty("country_code")
    private String countryCode;

    // Getters and setters (or lombok annotations) for the fields
}

