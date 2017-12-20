package com.critc.plat.aspect;

import com.critc.plat.sys.model.*;
import com.critc.plat.sys.service.LogService;
import com.critc.plat.util.date.DateUtil;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private LogService logService;

//    @Pointcut("execution(public * com.critc..*.controller.*.*(..))")

//    增、删、改
    @Pointcut("execution(public * com.critc..*.controller.*.add*(..)) " +
            "|| execution(public * com.critc..*.controller.*.update*(..)) " +
            "|| execution(public * com.critc..*.controller.*.delete*(..))" +
            "|| @annotation(com.critc.plat.aspect.Log)")
    public void log() {
    }

    @Pointcut("execution(public * com.critc..*.controller.*.login*(..))")
    public void log2() {
    }

    @Before("log()")
    public void doBefore(JoinPoint joinPoint) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        String url = request.getRequestURL().toString();
        String ip = request.getRemoteAddr().toString();
        String class_method = joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName();

        SysLog sysLog = new SysLog();
        sysLog.setOperaUrl(url);
        sysLog.setMethodName(class_method);
        sysLog.setOperaIp(ip);

        logService.addLog(sysLog);
    }

    @After("log2()")
    public void doAfter(JoinPoint joinPoint) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        String url = request.getRequestURL().toString();
        String ip = request.getRemoteAddr().toString();
        String class_method = joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName();

        SysLog sysLog = new SysLog();
        sysLog.setOperaUrl(url);
        sysLog.setMethodName(class_method);
        sysLog.setOperaIp(ip);

        logService.addLog(sysLog);
    }
}
