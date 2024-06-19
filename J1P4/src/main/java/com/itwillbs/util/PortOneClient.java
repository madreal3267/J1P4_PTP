package com.itwillbs.util;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import java.util.HashMap;
import java.util.Map;

@Component
public class PortOneClient {
    private final String apiKey = "4414108037381356";
    private final String apiSecret = "ZibEh3XQ3m1vKhcWd8PNsdUsR6OthKsD8Q95jXsaLxetieFk7lvaH4CIgeZ0qVGTSUQYTYGxuelTEvMr";
    private static final String API_URL = "https://api.iamport.kr";

    public PortOneClient() {}

    public PaymentResponse requestPayment(PaymentRequest request) {
        RestTemplate restTemplate = new RestTemplate();
        String accessToken = getAccessToken();

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", accessToken);
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<PaymentRequest> entity = new HttpEntity<>(request, headers);

        ResponseEntity<PaymentResponse> response = restTemplate.exchange(
                API_URL + "/payments/prepare",
                HttpMethod.POST,
                entity,
                PaymentResponse.class
        );

        return response.getBody();
    }

    private String getAccessToken() {
        RestTemplate restTemplate = new RestTemplate();

        Map<String, String> params = new HashMap<>();
        params.put("imp_key", apiKey);
        params.put("imp_secret", apiSecret);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, String>> entity = new HttpEntity<>(params, headers);

        ResponseEntity<Map> response = restTemplate.postForEntity(
                API_URL + "/users/getToken",
                entity,
                Map.class
        );

        Map<String, Object> responseBody = response.getBody();
        if (responseBody != null && responseBody.get("response") != null) {
            Map<String, String> responseMap = (Map<String, String>) responseBody.get("response");
            return responseMap.get("access_token");
        }

        throw new RuntimeException("Failed to retrieve access token");
    }

}
