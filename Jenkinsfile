pipeline {
    agent any
    
    environment {
        DOCKER_CREDENTIALS_ID = "docker"
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }
    stages {
        stage('Clean up') {
            steps {
                echo 'Initial : Stop and remove running containers'
                sh 'docker-compose -f ${DOCKER_COMPOSE_FILE} down --remove-orphans'
            }
        }
        stage('Build and Run Containers') {
            steps {
                echo 'Build and Run the Containers using Docker Compose'
                sh 'docker-compose -f ${DOCKER_COMPOSE_FILE} up -d'
            }
        }
        // stage('Push Images') {
        //     steps {
        //         echo 'Pushing Images'
        //         withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
        //             sh 'docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}'
        //             sh 'docker-compose -f ${DOCKER_COMPOSE_FILE} push'
        //         }
        //     }
        // }
        // stage('Trigger slave') {
        //     steps {
        //         build job: 'slave'
        //     }
        // }
    }
    
}