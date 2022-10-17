package com.sns.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sns.test.dao.TestDAO;

@Controller

public class TestController {
	
//	    @RequestMapping("/test1")
//	    public String helloWorld() {
//	        return "Hello world!";
//	    }
//	 @RequestMapping("/jsp")
//	 public String jsp() {
//		 return "test/test";
//	 }
	 @Autowired
	 private TestDAO testDAO;
	 @ResponseBody
	 @RequestMapping("/database")
	 public List<Map<String, Object>> database(){
		 return testDAO.selectTestList();
	 }
}
