package com.critc.plat.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wangyupeng on 2017/12/18.
 */
@Aspect
@Component
public class HttpAspect {

//    controller下所有方法都记录操作日志
//    @Pointcut("execution(public * com.critc..*.controller.*.*(..))")
//    有LOG注解的方法记录操作日志
//    @Pointcut("@annotation(com.critc.plat.aspect.Log)")

    @Pointcut("execution(public * com.critc..*.controller.*.*(..)) " +
            "&& !execution(public * com.critc..*.controller.*.index*(..))" +
            "&& !execution(public * com.critc..*.controller.*.load*(..))")
    public void log() {
    }

    @Before("log()")
    public void doBefore(JoinPoint joinPoint) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        System.out.println(request.getRequestURL());
//        System.out.println(request.getMethod());
//        System.out.println(request.getRemoteAddr());
//        System.out.println(joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
        //url
//        logger.info("url={}", request.getRequestURL());

        //method
//        logger.info("method={}", request.getMethod());

        //ip
//        logger.info("ip={}", request.getRemoteAddr());

        //类方法
//        logger.info("class_method={}", joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());

        //参数
//        logger.info("args={}", joinPoint.getArgs());
    }

    @After("log()")
    public void doAfter() {
//        System.out.println("222");
//        logger.info("222222222222");
    }
}
