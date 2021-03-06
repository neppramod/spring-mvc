echo '''<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:p="http://www.springframework.org/schema/p"
	xmlns:aop="http://www.springframework.org/schema/aop" xmlns:context="http://www.springframework.org/schema/context"
	xmlns:tx="http://www.springframework.org/schema/tx" xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-3.0.xsd
		http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd
		http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
		http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-3.0.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.0.xsd">

	<!-- Lets declare from were we are going to read project specific configuration -->
	<context:property-placeholder location="/WEB-INF/cfg/spring.properties" />

	<!-- Lets say we want to use @Transaction annotations -->
	<tx:annotation-driven transaction-manager="transactionManager" />

	<!-- It helps you use lazy loadings. If you remove this you will have to 
		use @Proxy(lazy = false) in some entity classes. Lazy false is very costly. 
		This bean keeps the hibernate session open long enough for the view to render what
		is needed before it is closed, thus allowing you to access your lazy loaded 
		associations without raising an exception -->
	<mvc:interceptors>
		<bean
			class="org.springframework.orm.hibernate3.support.OpenSessionInViewInterceptor">
			<property name="sessionFactory">
				<ref local="sessionFactory" />
			</property>
		</bean>
	</mvc:interceptors>

	<!-- Lets define our dataSource reading values from spring.properties -->
	<bean id="dataSource"
		class="org.springframework.jdbc.datasource.DriverManagerDataSource"
		p:driverClassName="${app.jdbc.driverClassName}" p:url="${app.jdbc.url}"
		p:username="${app.jdbc.username}" p:password="${app.jdbc.password}" />

	<!-- Hibernate Session Factory -->
	<bean id="sessionFactory"
		class="org.springframework.orm.hibernate3.annotation.AnnotationSessionFactoryBean"
		p:dataSource-ref="dataSource" p:configLocation="${hibernate.config}"
		p:packagesToScan="${hibernate.packagesToScan}" />

	<!-- Transaction Manager -->
	<bean id="transactionManager"
		class="org.springframework.orm.hibernate3.HibernateTransactionManager"
		p:sessionFactory-ref="sessionFactory" />
</beans>'''
