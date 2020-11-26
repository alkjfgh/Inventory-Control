package com.inventory.app.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	@Pointcut("execution(* com.inventory.app.impl..*Impl.*(..))")
	public void allPointcut() {}
	
	@Pointcut("execution(* com.inventory.app..*Impl.get*(..))")
	public void getPointcut() {}
}
