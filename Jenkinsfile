pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'pooja595'
        IMAGE_NAME = 'todo-app'
        IMAGE_TAG = "${pooja595}/${todo-app}:v1"
        REMOTE_HOST = 'masternode1@192.168.56.104'
        REMOTE_PASS = 'pooja123'
    }

    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    sh """
                    echo "Connecting to Remote Host..."
                    sshpass -p '${REMOTE_PASS}' ssh -o StrictHostKeyChecking=no -tt ${REMOTE_HOST} << EOF
                        cd /var/lib/jenkins/workspace/TO-DO-APP
                        
                        echo "Building Docker Image: ${IMAGE_TAG}"
                        echo '${REMOTE_PASS}' | sudo -S docker build -t ${IMAGE_TAG} .

                        echo "Pushing Image to DockerHub..."
                        echo '${REMOTE_PASS}' | sudo -S docker push ${IMAGE_TAG}

                        echo "Docker Image Built and Pushed: ${IMAGE_TAG}"
                        exit 0
EOF
                    """
                }
            }
        }
    }

    post {
        success {
            echo "Build Successful. Image pushed: ${IMAGE_TAG}"
        }
        failure {
            echo "Build Failed. Please check the logs."
        }
    }
}
