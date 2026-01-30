pipeline {
<<<<<<< HEAD
     agent any

    environment {
        IMAGE_NAME = "static-website"
        DOCKERHUB_USER = "shubhamtakalikar1@gmail.com"
    }
=======
    agent any
>>>>>>> origin/main

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/shubh-2344/mywebsite.git'
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
