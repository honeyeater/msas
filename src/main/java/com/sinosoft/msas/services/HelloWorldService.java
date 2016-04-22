package com.sinosoft.msas.services;

import org.springframework.stereotype.Service;

@Service
public class HelloWorldService implements HelloWorld {

	@Override
	public String greeting(String name) {
		return name + ", welcome you!";
	}

	@Override
	public String print() {
		return "hello world service";
	}

}
