pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-java-app . -f Dockerfile'
            }
        }
        stage('Push Docker Image to ECR') {
            steps {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin'
                sh 'docker push my-java-app'
            }
        }
    }
}
