echo '''# Our database properties for dataSource (spring-data.xml)

# We are going to use mysql
app.jdbc.driverClassName='''$APP_JDBC_DRIVER_CLASS_NAME'''

# Create datebase using "create database PROJECT_NAME"
app.jdbc.url='''$APP_JDBC_URL'''

app.jdbc.username='''$APP_JDBC_USERNAME'''
app.jdbc.password='''$APP_JDBC_PASSWORD'''

# Lets read some properties using standard hibernate properties
# We could just have done it in spring-data.xml
hibernate.config='''$HIBERNATE_CONFIG'''

# Auto scan files in following package for @Entity to create tables
hibernate.packagesToScan='''$HIBERNATE_PACKAGES_TO_SCAN