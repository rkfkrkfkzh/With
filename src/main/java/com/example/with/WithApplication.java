package com.example.with;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WithApplication {

	public static void main(String[] args) {
		SpringApplication.run(WithApplication.class, args);
		/*
		 * 보통 SpringApplication을 실행 할 때 위 한 줄을 추가한다. 하지만 이렇게 하면 SpringApplication이 제공하는
		 * 다양한 기능을 커스터마이징해서 사용하기 어렵다.
		 **/
		/*
		 * SpringApplication app = new SpringApplication(WithApplication.class);
		 * app.run(args); 따라서 SpringApplication의 여러 기능들을 입맛에 맞게 사용하고자 할 때는 위와 같이 Spring
		 * Application 인스턴스를 생성해 실행하는 편이 좋다.
		 */
	}

}
