package com.salesianos.triana.ComiendoPorTriana;

import com.salesianos.triana.ComiendoPorTriana.files.service.StorageService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class ComiendoPorTrianaApplication {

	public static void main(String[] args) {
		SpringApplication.run(ComiendoPorTrianaApplication.class, args);
	}

	@Bean
	CommandLineRunner init(StorageService storageService) {
		return (args) -> {
			//storageService.deleteAll();
			storageService.init();
		};
	}

	@Bean
	public WebMvcConfigurer corsConfigurer()
	{
		String[] allowDomains = new String[2];
		allowDomains[0] = "http://localhost:4200";
		allowDomains[1] = "http://localhost:8080";

		System.out.println("CORS configuration....");
		return new WebMvcConfigurer() {
			@Override
			public void addCorsMappings(CorsRegistry registry) {
				registry.addMapping("/**").allowedMethods("*").allowedHeaders("*").allowedOrigins(allowDomains);
			}
		};
	}

}
