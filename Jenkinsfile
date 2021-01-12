pipeline {
    agent any

    tools {
        // Install the Maven version configured as "Maven3.6.3" and add it to the path.
        maven "Maven3.6.3"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/ShivaniJ-hub/MusicStoreDemo.git' 

		//Creating version.html and writing string to it
		sh script:'''
		    	touch /musicstore/src/main/webapp/version.html
			echo "version1.0" > /musicstore/src/main/webapp/version.html
		'''
		    
                // To run Maven on agent, use
	         sh script:'''
			cd musicstore
			mvn clean package
		'''
            }
        }
        stage('Deploy') {
            steps {
		//Deploy to tomcat    
                deploy adapters: [tomcat9(credentialsId: 'af30273b-ac1d-45c0-8f0d-1bf67e0f9dc0', path: '', url: 'http://localhost:8081/')], contextPath: '/music', war: 'musicstore/target/*.war'
	    }
        }
	stage('Check HTTP status') {
            steps {
		//Display HTTP Status
                sh 'curl -I \'http://localhost:8081/music/index.html\' | grep HTTP'
		sh 'curl \'http://localhost:8081/music/version.html\''
	    }
        }
    }
}
