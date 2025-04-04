pipeline {
    agent any

    environment {
        AZURE_SUBSCRIPTION_ID = credentials('AZURE_SUBSCRIPTION_ID')
        AZURE_CLIENT_ID = credentials('AZURE_CLIENT_ID')
        AZURE_CLIENT_SECRET = credentials('AZURE_CLIENT_SECRET')
        AZURE_TENANT_ID = credentials('AZURE_TENANT_ID')
        AZURE_STORAGE_KEY = credentials('AZURE_STORAGE_KEY')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Virendra-94/WebApiJenkins'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        success {
            echo "Terraform deployment successful!"
        }
        failure {
            echo "Deployment failed!"
        }
    }
}
