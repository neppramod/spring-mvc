echo '''<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.0.xsd
		http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd">

	<!-- Package from where to scan for annotated classes. Do not worry if domain
		classes are outside (because we will tell hibernate to do that using spring) -->
	<!-- Do not worry if you have different name than specified in pom.xml -->
	<context:component-scan base-package="'''$BASE_PACKAGE'''" />

   <!-- Needed for @Controllers to be scanned and resolved. You no longer need to include Annotation classes for that. -->
	<mvc:annotation-driven />
'''
	if [ $CREATE_WELCOME_CONTROLLER = "y" ]; then
		echo '''
	<!-- Forward / to /welcome -->
	<mvc:view-controller path="/" view-name="/welcome" />'''
	fi
echo '''
	<!-- Read messages from messages.properties. -->
	<bean id="messageSource"
		class="org.springframework.context.support.ReloadableResourceBundleMessageSource">
		<property name="basename" value="/WEB-INF/messages/messages" />
		<property name="cacheSeconds" value="0" />
	</bean>

	<!-- We can access any file inside /resources/ without having to create @RequestMapping or other tricks for each -->
	<mvc:resources mapping="/resources/**" location="/resources/" />

	<!-- NOTE : Did not add org.springframework.web.servlet.i18n.LocaleChangeInterceptor in mvc:interceptor to change locale in runtime. You also have to create a bean org.springframework.web.servlet.i18n.CookieLocaleResolver to support locale.-->

	<!-- JSTL view resolver -->
	<bean
		class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<property name="prefix" value="/WEB-INF/jsp/" />
		<property name="suffix" value=".jsp" />
	</bean>
'''
if [ $USE_DATA_CONF = "y" ]; then
	echo '''<!-- Load data layer configuration -->
	<import resource="'''$DATA_CONF'''" />'''
fi

echo '''
</beans>'''
