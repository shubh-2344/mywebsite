pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/shubh-2344/mywebsite.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t simple-website:latest .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker rm -f simple-website || true
                docker run -d \
                  --name simple-website \
                  -p 82:80 \
                  simple-website:latest
                '''
            }
        }
    }
}
