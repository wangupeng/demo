package com.critc.plat.common.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by wangyupeng on 2017/12/19.
 * 全局异常处理
 */
@ControllerAdvice
public class ExceptionHandle {
    private static Logger logger = LoggerFactory.getLogger("sysLog");

    /*@ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ModelAndView handle(Exception e) {
        if (e instanceof MyException) {
            MyException myException = (MyException) e;

            ModelAndView mv = new ModelAndView("plat/common/500");//error页面
            mv.addObject("errorMsg",e.getMessage());
            logger.info( ((MyException) e).getCode() +":"+((MyException) e).getMessage());
            return mv;
        }else {
            ModelAndView mv = new ModelAndView("plat/common/500");//error页面
            mv.addObject("errorMsg",e.getMessage());
            logger.info("【系统异常】{}",e.getMessage());
            return mv;
        }
    }*/

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ModelAndView handle(Exception e) {
        ModelAndView mv = new ModelAndView("plat/common/500");//error页面
        mv.addObject("errorMsg",e.getMessage());
        logger.info("【系统异常】{}",e.getMessage());
        return mv;
    }

    @ExceptionHandler(value = MyException.class)
    @ResponseBody
    public ModelAndView myHandle(MyException e) {
            ModelAndView mv = new ModelAndView("plat/common/500");//error页面
            mv.addObject("errorMsg",e.getMessage());
            logger.info("【系统异常】{}",((MyException) e).getCode() +":"+((MyException) e).getMessage());
            return mv;
    }
}
