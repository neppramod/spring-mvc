#!/bin/bash

SCRIPT_DIRECTORY=/etc/spring-mvc/
SPRING_SCRIPT=/usr/bin/spring.sh

cp spring.sh $SPRING_SCRIPT
chmod +x $SPRING_SCRIPT

if [ ! -d $SCRIPT_DIRECTORY ]; then
	echo "Creating $SCRIPT_DIRECTORY"
	mkdir $SCRIPT_DIRECTORY
else
	echo "Directory already exists overriding it"
fi

cp -R conf data help README.md $SCRIPT_DIRECTORY

echo ""
echo "Successfully installed"
echo ""
