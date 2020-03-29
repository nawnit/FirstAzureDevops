pipeline {
    agent any

	tools {
		maven 'maven 3.6.3'
	}
//
//	environment {
//		M2_INSTALL = "/home/gamut/Distros/apache-maven-3.6.0/bin/mvn"
//	}

    stages {
		stage('Clone-Repo') {
			steps {
				checkout scm
			}
		}
		stage('Build') {
	    	steps {
				sh 'mvn install -DskipTests'
			}
	    }
		stage('Unit Tests') {
			steps {
				sh 'mvn surefire:test'
			}
		}
		stage('Deployment') {
	    	steps {
				print "Deployment is done!"
				//sh 'sshpass -p "1234" scp target/gamutkart.war nawnit@172.17.0.3:/home/nawnit/Distros/apache-tomcat-8.5.53/webapps'
				//sh 'sshpass -p "1234" ssh nawnit@172.17.0.3 "JAVA_HOME=/home/nawnit/Distros/jdk1.8.0_211" "/home/nawnit/Distros/apache-tomcat-8.5.53/bin/startup.sh"'
	    	
                                sh 'sshpass -p 123 scp target/firstwebapp.war nitin@172.17.0.4:/home/nitin/Distros/apache-tomcat-8.5.51/webapps'
				sh 'sshpass -p 123 ssh nitin@172.17.0.4 "JAVA_HOME=/home/nitin/Distros/jdk1.8.0_241" "/home/nitin/Distros/apache-tomcat-8.5.51/bin/startup.sh"'

		}
		}
    }
}
