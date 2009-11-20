/**
 * 
 */
package com.exist.ems.aop;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

import com.exist.ems.exception.EmsException;

/**
 * @author Emmanuel Nollase emanux
 * @created 2009 11 18 - 11:05:13
 * 
 */
@Aspect
public class AopLogger
{
    
    // for now just output in console using Log
    private static final Log log = LogFactory.getLog("aop.logger");
    
    @Pointcut("execution(* com.exist.ems.service..EmsService+.*(..))")
    public void logger(){}
 
    
    @Before("logger()")
    public void beforeAdvice(JoinPoint joinPoint)
    {
	log.info("Entering method: "+joinPoint.getSignature().getName());
    }
    
    @AfterThrowing(pointcut="logger()",throwing="ex")
    public void afterThrowing(JoinPoint jp,EmsException ex)
    {
	log.info("Error while executing the method: "+jp.getSignature().getName());
	log.info("Root exception: "+ex.getCause().getClass().getName());
	log.info("Exception message: "+ex.getMessage());
    }
}
