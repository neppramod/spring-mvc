#!/bin/bash
# Simple bash script that helps to create spring 3 web mvc project
#
# This script will grow and my default might not suit you, so 
# Every project can have data version specific or local spring 
# configuration file (usually spring.cfg)
# that can override default spring.cfg constants.
#
# @author Pramod Nepal
# Sat Jul  7 17:14:53 NPT 2012

# Don't worry, we need at least some place to start
# For copying default configuration files
# You can create your own version of DATA_DIRECTORY
# By ovverriding DATA_DIRECTORY variable
# in local configuration file
SCRIPT_DIRECTORY="/etc/spring-mvc"

# Default configuration file
source $SCRIPT_DIRECTORY/conf/spring.cfg

# Set some defaults (for conf, pom.xml etc)
if [ -d "$SCRIPT_DIRECTORY/data/$DATA_VERSION" ]; then
	echo "Using $DATA_VERSION directory"
	DATA_DIRECTORY=$SCRIPT_DIRECTORY/data/$DATA_VERSION	
else
	echo "Did not find $DATA_VERSION directory, using default"
fi

echo ""
# You can set configuration file in 
# individual data directory too
if [ -f "$DATA_DIRECTORY/$DATA_DIRECTORY_CONFIG_FILE" ]; then
	source $DATA_DIRECTORY/$DATA_DIRECTORY_CONFIG_FILE
else
	echo "No data specific configuration file, so using default"
	echo ""
fi


# Respect local configuration over default
if [ -f "$LOCAL_SPRING_CONFIG_FILE" ]; then
	source $PWD/$LOCAL_SPRING_CONFIG_FILE
	echo "Using local configuration file"
else
	echo """No local configuration file, so using default. Strongly encourage to at least create $LOCAL_SPRING_CONFIG_FILE and change some defaults..."""
	echo ""
fi

echo ""

# If directory with same name exists delete it 
# if DELETE_PROJECT_WITH_SAME_NAME set to y
if [ $DELETE_PROJECT_WITH_SAME_NAME = "y" ]; then
	rm -rf $ARTIFACT_ID
	echo """Deleted previous project with name """$ARTIFACT_ID""". Configure \"DELETE_PROJECT_WITH_SAME_NAME\" if you want otherwise."""	
	echo ""
fi

# Do what ever is written in database script file
if [ $DATA_BASE_SCRIPT = "y" ]; then
	source "$DATA_DIRECTORY/$DATABASE_SCRIPT_FILENAME"
	echo "Successfully created database $DATABASE_NAME"
	echo ""
fi

# Lets create appropriate directory using pom.xml
# from DATA_DIRECTORY

echo ""
if [ ! -d $ARTIFACT_ID ]; then
	mkdir $ARTIFACT_ID
	cd $ARTIFACT_ID

	mkdir -p $PROJECT_DIRECTORY_STRUCTURE
	source $DATA_DIRECTORY/pom.xml.sh > pom.xml
	source $DATA_DIRECTORY/web.xml.sh > src/main/webapp/WEB-INF/web.xml
	cp $DATA_DIRECTORY/messages.properties src/main/webapp/WEB-INF/messages/
	source $DATA_DIRECTORY/spring.properties.sh > src/main/webapp/WEB-INF/messages/spring.properties
	source $DATA_DIRECTORY/hibernate.cfg.xml.sh > src/main/webapp/WEB-INF/hibernate.cfg.xml

	if [ $CREATE_WELCOME_CONTROLLER = "y" ]; then
		source "$DATA_DIRECTORY/welcomeclass.sh"
	fi

	echo "Project \"$ARTIFACT_ID\" successfully created. !!"	
	echo ""
else
	echo "Sorry project directory already exists. !!"
	echo ""
fi
