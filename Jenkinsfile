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

                // Run Maven on a Unix agent.
                //sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
				bat "cd ./musicstore"
                bat "mvn clean package"
            }
        }
        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9(credentialsId: '76932011-a95b-43bb-acb3-753224d64865', path: '', url: 'http://localhost:8081/')], contextPath: '/music', war: 'musicstore/target/*.war'
            }
        }
    }
}
