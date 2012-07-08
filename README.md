spring-mvc
==========

Bash script to setup spring 3 mysql project using configuration file (that can be overridden), templates etc.

Introduction
============
This project creates a template spring project using the settings in a configuration file.

I felt writing this project, because I wanted to create a template spring project that I can use to get going, without worrying how would I configure controllers, sessions, dao, domain, views etc. 

Even if you don't configure anything you will still have a working maven spring 3 project that creates a database in mysql, creates packages (like controller, servie, dao, domain, component) based on GROUP_ID. When you run the project using

mvn clean package jetty:run

you will be greeted with a welcome page. From there you can start adding domain, dao, service, controller and appropriate views to get going.

How to work
===========

You can just run the script and you are ready to work. 

If you like to configure the project just copy the spring.cfg configuration file from modules/some-module-name directory of the installation directory to your current directory and start editing the variables as your liking. If you are happy with just changing project name, packages, servlet name, database values you don't have to touch anyother file than this configuration file. 

However if you have a different workflow you can copy the data directory too to your current directory, change the DATA_DIRECTORY value to point to your data directory. Next you can even have different directories inside this directory to have different versions of configuration files (they mean different workflow). If you have different workflow you will certainly want to configure web.xml.sh to your liking. 

Files inside this directory are simple simple bash files containing templates for the project. All the packages (directory strucute) get created using the variables from the configuration file.

If you have local config file (usually called spring.cfg) in current directory it will override one from DATA_DIRECTORY (if any) and that will override one from cfg directory(default if not specified any other).

At the end of the day it is a simple spring 3 project, you can configure it however you like (you will have your pom.xml file, your web.xml file (that loads spring configuration files like service, data xml files) using ContextLoadListener. Your dispatcher servlet loads the default spring servlet configuration file. These files configure things like locale, views, messages, database etc.

Since this project supports modules and spring.sh is going to run MODULE_SCRIPT_FILE (usually setup-module.sh) from DEFAULT_MODULE_DIRECTORY or LOCAL_SCRIPT_FILE (setup.sh) from LOCAL_CONFIGURATION_DIRECTORY. You can copy one of the data directory from modules directory of installation and start editing it. You are encouraged to copy spring.cfg file to your current directory and edit it to your liking. With this freedom you can create a completely new work flow. In such case it is wise to create a new module. Create three files (setup-module.sh, spring.cfg and your usual data directory that gets run from setup-module.sh). If you like to create lots of modules in current directory, the only final option remains is override variables in global-spring.cfg variables using spring.cfg (this is just like creating a completely new world). 

This project contains a reference implementation of basic spring project. I encourage you to create a new module. I.e copy a directory inside modules directory and start editing its files and finally while running spring.sh override DEFAULT_MODULE variable to point to your new module.

Run the project
===============
After you run spring.sh a project directory will be created (if you don't override ARTIFACT_ID the project will be usually called "tmpprj" with package name "change.packages.name". Make sure you have mysql installed.

$ spring.sh

Unless you override spring.cfg database name is going to be ARTIFACT_ID (project name), username is going to be "root" and password "password". Database will be configured to use InnoDB and it will be generated when you start adding the domain classes.

Go into the project directory and run it.

$ mvn clean package jetty:run

