package com.salesianos.triana.ComiendoPorTriana.security.errorhandling;

public class JwtTokenException extends RuntimeException{

    public JwtTokenException(String msg) {
        super(msg);
    }
}
