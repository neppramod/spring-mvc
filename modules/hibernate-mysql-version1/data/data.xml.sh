echo '''<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:p="http://www.springframework.org/schema/p"
	xmlns:tx="http://www.springframework.org/schema/tx" xmlns:context="http://www.springframework.org/schema/context"
	xmlns:aop="http://www.springframework.org/schema/aop"
	xsi:schemaLocation="
			http://www.springframework.org/schema/beans 
			http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
			http://www.springframework.org/schema/tx 
			http://www.springframework.org/schema/tx/spring-tx-3.0.xsd
			http://www.springframework.org/schema/context
			http://www.springframework.org/schema/context/spring-context-3.0.xsd
	   		http://www.springframework.org/schema/aop 
			http://www.springframework.org/schema/aop/spring-aop-3.0.xsd">

	<context:property-placeholder location="/WEB-INF/messages/spring.properties" />
	
	<!-- Shiro stype -->
	<aop:aspectj-autoproxy proxy-target-class="true"/>
	

	<!-- <context:annotation-config /> -->
	<context:component-scan base-package="'''$BASE_PACKAGE'''" />

	<bean id="lifecycleBeanPostProcessor" class="org.apache.shiro.spring.LifecycleBeanPostProcessor" />


	<!-- Spring AOP auto-proxy creation (required to support Shiro annotations) -->
	<bean
		class="org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator"
		depends-on="lifecycleBeanPostProcessor" />



	<!-- Enable annotation style of managing transactions -->
	<tx:annotation-driven transaction-manager="transactionManager" />

	<bean id="dataSource"
		class="org.springframework.jdbc.datasource.DriverManagerDataSource"
		p:driverClassName="${app.jdbc.driverClassName}" p:url="${app.jdbc.url}"
		p:username="${app.jdbc.username}" p:password="${app.jdbc.password}" />


	<!-- Declare the Hibernate SessionFactory for retrieving Hibernate sessions -->
	<!-- See http://static.springsource.org/spring/docs/3.0.x/javadoc-api/org/springframework/orm/hibernate3/annotation/AnnotationSessionFactoryBean.html -->
	<!-- See http://docs.jboss.org/hibernate/stable/core/api/index.html?org/hibernate/SessionFactory.html -->
	<!-- See http://docs.jboss.org/hibernate/stable/core/api/index.html?org/hibernate/Session.html -->
	<bean id="sessionFactory"
		class="org.springframework.orm.hibernate3.annotation.AnnotationSessionFactoryBean"
		p:dataSource-ref="dataSource" p:configLocation="${hibernate.config}"
		p:packagesToScan="${hibernate.packagesToScan}" p:schemaUpdate="true">
		<property name="eventListeners">
			<map>
				<entry key="merge">
					<bean
						class="org.springframework.orm.hibernate3.support.IdTransferringMergeEventListener" />
				</entry>
			</map>
		</property>
	</bean>

	<!-- Declare a datasource that has pooling capabilities -->


	<!-- <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" 
		destroy-method="close" p:driverClassName="${app.jdbc.driverClassName}" p:url="${app.jdbc.url}" 
		p:username="${app.jdbc.username}" p:password="${app.jdbc.password}" /> -->


	<!-- <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource" 
		p:driverClassName="${app.jdbc.driverClassName}" p:url="${app.jdbc.url}" p:username="${app.jdbc.username}" 
		p:password="${app.jdbc.password}" /> -->

	<!-- Declare a transaction manager -->
	<bean id="transactionManager"
		class="org.springframework.orm.hibernate3.HibernateTransactionManager"
		p:sessionFactory-ref="sessionFactory" />

</beans>'''