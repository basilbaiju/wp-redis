pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "wordpress-redis"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: master , url:'https://github.com/basilbaiju/wp-redis.git'
                
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building the Docker image...'
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Deploy using Docker Compose') {
            steps {
                echo 'Deploying application with Docker Compose...'
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up resources...'
            sh 'docker-compose down || true'
            sh 'docker system prune -f -a --volumes || true'
        }
        success {
            echo 'Deployment completed successfully.'
        }
        failure {
            echo 'Deployment failed. Please check the logs.'
        }
    }
}
