package com.sycho.spring.sychosimpleawsapplication;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

@RestController
@SpringBootApplication
public class SimpleApplication {

    public static void main(String[] args) {
        SpringApplication.run(SimpleApplication.class, args);
    }

    @GetMapping("/ip")
    public Map<String, String> ip(HttpServletRequest request) throws UnknownHostException {
        return new HashMap<>() {{
            put("hostIp", InetAddress.getLocalHost().getHostAddress());
            put("accessIp", request.getHeader("x-forwarded-for"));
        }};
    }

    @GetMapping("/script-health-check")
    public ResponseEntity<?> scriptHealthCheck() {
        return ResponseEntity.ok().build();
    }

}
