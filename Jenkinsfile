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
                sh 'docker-compose down --remove-orphans'
            }
        }
        stage('Build and Run Containers') {
            steps {
                echo 'Build and Run the Containers using Docker Compose'
                sh 'docker-compose up -d'
            }
        }
    }
}