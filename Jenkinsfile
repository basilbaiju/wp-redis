pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/basilbaiju/wp-redis.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t wordpress-redis .'
            }
        }

        stage('Deploy Using Docker Compose') {
            steps {
                sh 'docker-compose down || true' 
                sh 'docker-compose up -d'     
            }
        }
    }


}
