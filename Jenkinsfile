pipeline {
    agent any
    
    environment {
        DOCKER_CREDENTIALS_ID = "docker"
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }
    stages {
        stage('Install Docker Compose') {
            steps {
                sh 'curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose'
                sh 'sudo mv ~/docker-compose /usr/local/bin/docker-compose'
                sh 'chmod +x /usr/local/bin/docker-compose'
            }
        }
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
    }
}