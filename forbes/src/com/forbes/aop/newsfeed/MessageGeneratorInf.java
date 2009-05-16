package com.forbes.aop.newsfeed;

import java.lang.reflect.Method;

public interface MessageGeneratorInf {
	public void genMessage(Object returnValue,Method method,Object[] args,Object target);
}
