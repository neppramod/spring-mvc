echo '''<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE hibernate-configuration PUBLIC
  "-//Hibernate/Hibernate Configuration DTD//EN"
  "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">

<hibernate-configuration>
	<session-factory>
		<property name="hibernate.dialect">'''$HIBERNATE_DIALECT'''</property>
		<property name="hibernate.jdbc.fetch_size">'''$HIBERNATE_JDBC_FETCH_SIZE'''</property>
		<property name="hbm2ddl.auto">'''$HIBERNATE_HBM2DDL_AUTO'''</property>
		<property name="show_sql">'''$HIBERNATE_SHOW_SQL'''</property>
		<property name="format_sql">'''$HIBERNATE_FORMAT_SQL'''</property>
	</session-factory>
</hibernate-configuration>'''