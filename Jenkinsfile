pipeline {
    agent any
    
    environment {
        DOCKER_CREDENTIALS_ID = "docker"
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }
    stages {
        stage('Clean up') {
            steps {
                echo 'Initial : Stop and remove running container'
                sh 'docker-compose -f ${DOCKER_COMPOSE_FILE} down --remove-orphans'
            }
        }
        stage('Build and Run Containers') {
            steps {
                echo 'Build and Run the Containers using Docker Compose'
                sh 'docker-compose -f ${DOCKER_COMPOSE_FILE} up -d'
            }
        }
    }
}