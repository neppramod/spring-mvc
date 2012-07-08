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

source $DATA_DIRECTORY/servlet.xml.sh > src/main/webapp/WEB-INF/$SERVLET_NAME-servlet.xml

if [ $USE_SERVICE_CONF = "y" ]; then
	source $DATA_DIRECTORY/service.xml.sh > src/main/webapp/WEB-INF/$SERVICE_CONF
fi

if [ $USE_DATA_CONF = "y" ]; then
	echo '''
	<listener>
		<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
	</listener>

	<context-param>
		<param-name>contextConfigLocation</param-name>
		<param-value>
            		/WEB-INF/'''$DATA_CONF '''/WEB-INF/'''$SERVICE_CONF
	
	echo '''		</param-value>
	</context-param>
	'''
	source $DATA_DIRECTORY/data.xml.sh > src/main/webapp/WEB-INF/$DATA_CONF
fi

# Close web-app
echo '''
</web-app>
'''