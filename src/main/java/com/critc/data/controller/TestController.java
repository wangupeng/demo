package com.critc.data.controller;

import com.critc.plat.aspect.Log;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wangyupeng on 2017/12/18.
 */
@RestController
public class TestController {

    @RequestMapping(value="/test",method= RequestMethod.GET)
    @Log
    public String login(HttpServletRequest request){

        return "test";
    }
}
