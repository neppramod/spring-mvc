#Start web-app
echo '''<?xml version="1.0" encoding="UTF-8"?>
<web-app version="2.4" xmlns="http://java.sun.com/xml/ns/j2ee"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">

	<!-- Dispatcher Servlet (Front end controller servlet) -->
	<servlet>
		<servlet-name>'''$SERVLET_NAME'''</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<load-on-startup>1</load-on-startup>
	</servlet>

	<servlet-mapping>
		<servlet-name>'''$SERVLET_NAME'''</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>
'''

if [ $USE_SERVICE_CONF = "y" ]; then
	echo '''
	<listener>
		<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
	</listener>

	<context-param>
		<param-name>contextConfigLocation</param-name>
		<param-value>
            		/WEB-INF/'''$SERVICE_CONF 

    if [ $USE_DATA_CONF = "y" ]; then
		echo '''/WEB-INF/'''$DATA_CONF
	fi
	
	echo '''		</param-value>
	</context-param>
	'''	
fi

# Close web-app
echo '''
</web-app>
'''