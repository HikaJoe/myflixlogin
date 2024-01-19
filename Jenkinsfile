pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKERHUB_USERNAME = 'Jhika'
        DOCKERHUB_PASSWORD = 'Hika 32146'
        IMAGE_TAG = 'Jhika/Login-app' // Change as needed
        REPOSITORY_NAME = 'myflix-docker'
         DOCKERFILE_NAME = 'logindockerfile'
    }

    stages {
        stage('Checkout') {
            steps {
                // Check out source code from GitHub
                checkout scm
            }
        }

        stage('Build Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build("${DOCKERHUB_USERNAME}/${REPOSITORY_NAME}:${IMAGE_TAG}", "-f ${DOCKERFILE_NAME} .")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub
                    sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                    // Push the image
                    docker.push("${DOCKERHUB_USERNAME}/${REPOSITORY_NAME}:${IMAGE_TAG}")
                }
            }
        }
    }

    post {
        always {
            // Logout from Docker Hub to secure the credentials
            sh "docker logout"
        }
    }
}
