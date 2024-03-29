package com.example.demo;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AddressDTO {
    private String county;
    private String postcode;
    @JsonProperty("state_district")
    private String stateDistrict;
    private String state;
    @JsonProperty("ISO3166-2-lvl4")
    private String iso3166_2_lvl4;
    private String country;
    @JsonProperty("country_code")
    private String countryCode;

    // Getters and setters
    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
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

    public String getIso3166_2_lvl4() {
        return iso3166_2_lvl4;
    }

    public void setIso3166_2_lvl4(String iso3166_2_lvl4) {
        this.iso3166_2_lvl4 = iso3166_2_lvl4;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }
}
