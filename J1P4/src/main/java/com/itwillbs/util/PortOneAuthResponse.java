package com.itwillbs.util;

public class PortOneAuthResponse {
	
	private AuthResponse response;

    public static class AuthResponse {
        private String access_token;

        public String getAccessToken() {
            return access_token;
        }

        public void setAccessToken(String access_token) {
            this.access_token = access_token;
        }
    }

    public AuthResponse getResponse() {
        return response;
    }

    public void setResponse(AuthResponse response) {
        this.response = response;
    }
}
