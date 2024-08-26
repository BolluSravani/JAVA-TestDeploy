pipeline {
    agent any

    environment {
        AWS_ACCOUNT_ID = '440744227535'
        AWS_REGION = 'us-east-1'
        ECR_REPO = 'jenkins5'
        IMAGE_TAG = "latest"
    }
    stages{
        stage('Checkout Code'){
             steps {
                git credentialsId: '653aec7d-01d8-4f25-b8c9-6e264d08c991', url: 'https://github.com/BolluSravani/JAVA-TestDeploy.git'
            }
        }
    }
        stage('Build Docker Image') {
            steps {
                script {
                    dir('app/src/hello-world') {
                        dockerImage = docker.build("${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:${IMAGE_TAG}")
                    }
                }
            }
        }
        ///Push image to ECR
        stage('Push to ECR'){
            steps {
                 withAWS(region: "${AWS_REGION}", credentials: 'aws-credentials') {
                    script {
                        sh '''
                        aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
                        docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:${IMAGE_TAG}
                        '''
                    }
                }
            }
        }
        
}
