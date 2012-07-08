echo '''<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:p="http://www.springframework.org/schema/p"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="http://www.springframework.org/schema/beans 
	   		http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
	   		http://www.springframework.org/schema/context
	   		http://www.springframework.org/schema/context/spring-context-3.0.xsd
			http://www.springframework.org/schema/mvc 
			http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd">

	
	
	<!-- Required for security annotations to work in this servlet -->

	<!--
	<bean
		class="org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator" />
	<bean
		class="org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor" />
	-->

	<!-- Activates various annotations to be detected in bean classes -->
	<context:annotation-config />

	<!-- Scans the classpath for annotated components that will be auto-registered 
		as Spring beans. For example @Controller and @Service. Make sure to set the 
		correct base-package -->
	<context:component-scan base-package="'''$BASE_PACKAGE'''" />

	<!-- Configures the annotation-driven Spring MVC Controller programming 
		model. Note that, with Spring 3.0, this tag works in Servlet MVC only! -->
	<mvc:annotation-driven />


	<!-- Forwards requests to the "/" resource to the "welcome" view -->
	<mvc:view-controller path="/" view-name="/" />

	<!-- Configures Handler Interceptors -->
	<!-- Changes the locale when a locale request parameter is sent; e.g. 
		/?locale=de -->
	<mvc:interceptors>
		<bean class="org.springframework.web.servlet.i18n.LocaleChangeInterceptor" />
	</mvc:interceptors>

	<!-- Saves a locale change using a cookie -->
	<bean id="localeResolver"
		class="org.springframework.web.servlet.i18n.CookieLocaleResolver" />

	<!-- Application Message Bundle -->

	<bean id="messageSource"
		class="org.springframework.context.support.ReloadableResourceBundleMessageSource">
		<property name="basename" value="/WEB-INF/messages/messages" />
		<property name="cacheSeconds" value="0" />
	</bean>


	<!-- Handles HTTP GET requests for /resources/** by efficiently serving 
		up static resources in the ${webappRoot}/resources/ directory -->
	<mvc:resources mapping="/resources/**" location="/resources/" />


	<!-- Declare a view resolver -->
	<bean id="viewResolver"
		class="org.springframework.web.servlet.view.InternalResourceViewResolver"
		p:prefix="/WEB-INF/jsp/" p:suffix=".jsp" />

</beans>'''