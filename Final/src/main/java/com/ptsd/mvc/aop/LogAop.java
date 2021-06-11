package com.ptsd.mvc.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogAop {

	public void before(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget()+""); // 대상 객체
		logger.info("---------AOP Start---------");
		
		Object[] args = join.getArgs(); //대상 파라미터
		if(args != null) {
			logger.info("method :"+ join.getSignature().getName()); //대상 메서드 정보
			
			for(int i = 0; i<args.length;i++) {
				logger.info(i+"번째 :"+args[i]);
				
			}
		}
				
	}
	
	public void after(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget()+"");
		logger.info("-------AOP End--------");
	}
	
	public void afterThrowing(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget()+"");
		logger.info("------AOP Error Log--------");
		logger.info("ERROR : "+join.getArgs());
		logger.info("ERROR : "+join.toString());
		
	}
	
}
