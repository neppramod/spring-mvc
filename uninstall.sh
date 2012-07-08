#!/bin/bash

SCRIPT_DIRECTORY=/etc/spring-mvc/
SPRING_SCRIPT=/usr/bin/spring.sh

if [ -d $SCRIPT_DIRECTORY ]; then
	rm -rf $SCRIPT_DIRECTORY
	echo "Deleted $SCRIPT_DIRECTORY configuration directory"
else
	echo "$SCRIPT_DIRECTORY does not exist"	
fi

if [ -f $SPRING_SCRIPT ]; then
	rm $SPRING_SCRIPT
	echo "$SPRING_SCRIPT successfully deleted"
else
	echo "$SPRING_SCRIPT does not exist, nothing to delete"
fi	

echo ""
echo "Successfully uninstalled"
echo ""
