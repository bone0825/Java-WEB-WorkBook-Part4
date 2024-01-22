package org.zerock.springex.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;

@Log4j2
@Controller
public class SampleController {
    @GetMapping("/hello") //get 방식의 요청 처리
    public void hell(){
        log.info("hello....");
    }

    @GetMapping("/ex1")//필요한 파라미터 자동 수집
    public void ex1(@RequestParam(name = "name") String name,
                    @RequestParam(name = "age") int age){

        System.out.println("ex111111111");
        System.out.println("name : " + name);
        System.out.println("age : " + age);
        log.info("ex1..........");
        log.info("name: " + name);
        log.info("age: " + age);
    }

    @GetMapping("/ex2")
    public void ex2(@RequestParam(name = "dueDate") LocalDate dueDate){
        log.info("ex22222..............");
        log.info("dueDate : " + dueDate);
    }

    @GetMapping("/ex3")
    public void ex3(Model model){
        log.info("-----------------------------------");
        model.addAttribute("message","Hello World");
    }
}
