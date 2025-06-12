pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'pooja595'
        IMAGE_NAME = 'todo-app'
        IMAGE_TAG = "${pooja595}/${pooja595}:v1"
        REMOTE_HOST = 'masternode1@192.168.56.104'
        REMOTE_PASS = 'pooja123'
    }

    stages { 
        stage('Build and Push Docker Image on Remote') {
            steps {
                script {
                    sh """
                    sshpass -p '${REMOTE_PASS}' ssh -o StrictHostKeyChecking=no -tt ${REMOTE_HOST} << EOF
                    cd /var/lib/jenkins/workspace/TO-DO-APP
                    echo '${REMOTE_PASS}' | sudo -S docker build -t ${IMAGE_TAG} .
                    echo '${REMOTE_PASS}' | sudo -S docker login -u ${DOCKERHUB_USER} -p ${REMOTE_PASS}
                    echo '${REMOTE_PASS}' | sudo -S docker push ${IMAGE_TAG}
                    exit 0
EOF
                    """
                }
            }
        }
    }

    post {
        success {
            mail to: 'pooja.bharambe@bankaiinformatics.co.in',
                 subject: "Build SUCCESS - Docker Image Pushed",
                 body: "The Docker image ${IMAGE_TAG} was built and pushed successfully."
        }
        failure {
            mail to: 'pooja.bharambe@bankaiinformatics.co.in',
                 subject: "Build FAILURE - Docker Image",
                 body: "The Jenkins pipeline failed during Docker build or push. Please check the console log."
        }
    }
}
