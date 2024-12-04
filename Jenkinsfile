pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                git branch: master , url:''
                
            }
        }

        stage('docker build'){
            steps{
                sh 'docker build -t wordpress-redis .'
            }
        }

        stage('deploy using docker-compose') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            sh 'docker-compose down || true'
            sh 'docker system prune -f'
        }
    }
}