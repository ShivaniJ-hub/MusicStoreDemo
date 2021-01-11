pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven3.6.3"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', credentialsId: '278800bc-e334-4779-bd6f-42fc6387335e', url: 'https://github.com/ShivaniJ-hub/MusicStoreDemo.git' 


                // To run Maven on agent, use
				sh script:'''
					cd musicstore
					mvn clean package
				'''
            }
        }
        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'af30273b-ac1d-45c0-8f0d-1bf67e0f9dc0', path: '', url: 'http://localhost:8081/')], contextPath: '/music', war: 'musicstore/target/*.war'
	    }
        }
	stage('Check status') {
            steps {
                sh 'curl -I \'http://localhost:8081/music/\''
	    }
        }
    }
}
