pipeline {
    agent any

    environment {
        // Define any environment variables if required
        DOCKER_IMAGE_NAME = 'wordpress-redis'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/basilbaiju/wp-redis.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE_NAME} .'
            }
        }

        stage('Deploy Using Docker Compose') {
            steps {
                sh 'docker-compose down || true' // Stop any existing containers
                sh 'docker-compose up -d'       // Start new containers
            }
        }
    }


}
