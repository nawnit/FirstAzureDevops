#!/bin/bash
##
##
ENVIRONMENT=$1
if [ $ENVIRONMENT = "QA" ];then
                                sshpass -p "1234" ssh nawnit@172.17.0.3 "JAVA_HOME=/home/nawnit/Distros/jdk1.8.0_241" "/home/nawnit/Distros/apache-tomcat-8.5.53/bin/shutdown.sh"
				print " QA deployment is done!"
				sshpass -p 1234 ssh nawnit@172.17.0.3 "JAVA_HOME=/home/nawnit/Distros/jdk1.8.0_241" "rm /home/nawnit/Distros/apache-tomcat-8.5.53/webapps/gamutkart.war"
				sshpass -p "1234" scp target/gamutkart.war nawnit@172.17.0.3:/home/nawnit/Distros/apache-tomcat-8.5.53/webapps
				sshpass -p "1234" ssh nawnit@172.17.0.3 "JAVA_HOME=/home/nawnit/Distros/jdk1.8.0_241" "/home/nawnit/Distros/apache-tomcat-8.5.53/bin/startup.sh"
	    	
                           

elif  [ $ENVIRONMENT = "PROD" ];then
	 sshpass -p "1234" ssh nawnit@172.17.0.4 "JAVA_HOME=/home/nawnit/Distros/jdk1.8.0_241" "/home/nawnit/Distros/apache-tomcat-8.5.53/bin/shutdown.sh"
				print "PROD deployment is done!"
				sshpass -p 1234 ssh nawnit@172.17.0.4 "JAVA_HOME=/home/nawnit/Distros/jdk1.8.0_241" "rm /home/nawnit/Distros/apache-tomcat-8.5.53/webapps/gamutkart.war"
				sshpass -p "1234" scp target/gamutkart.war nawnit@172.17.0.4:/home/nawnit/Distros/apache-tomcat-8.5.53/webapps
				sshpass -p "1234" ssh nawnit@172.17.0.4 "JAVA_HOME=/home/nawnit/Distros/jdk1.8.0_241" "/home/nawnit/Distros/apache-tomcat-8.5.53/bin/startup.sh"
echo "deployment has been done!"
fi
