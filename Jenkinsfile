pipeline {
     agent any

    environment {
        IMAGE_NAME = "static-website"
        DOCKERHUB_USER = "shubhamtakalikar1@gmail.com"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/YOUR_USERNAME/static-website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Docker Login and Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                        echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
                        docker tag $IMAGE_NAME $DOCKERHUB_USER/$IMAGE_NAME:latest
                        docker push $DOCKERHUB_USER/$IMAGE_NAME:latest
                    """
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh """
                    docker rm -f static-website || true
                    docker run -d --name static-website -p 8080:80 $DOCKERHUB_USER/$IMAGE_NAME:latest
                """
            }
        }
    }
}
