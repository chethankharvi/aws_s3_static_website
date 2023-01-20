pipeline {
    agent any
    tools {
        terraform 'Terraform'
    }
    parameters {
                choice choices: ['apply', 'destroy'], description: 'Choose Action', name: 'Action'
    }
    stages {
        stage('git checkout'){
        steps {
            git branch: 'main', url: 'https://github.com/chethankharvi/aws_s3_static_website.git'
            }
        }
        stage('terraform init'){
            steps{
                withAWS(credentials: 'jenkins_test_user', region: 'us-east-1'){
                sh 'terraform init'
            }
            }
        }
        stage('terraform validate'){
            steps{
                sh 'terraform validate'
            }
        }
        stage('terrraform fmt'){
            steps{
                sh 'terraform fmt'
            }
        }
        stage('Terraform Plan'){
            steps {
                withAWS(credentials: 'jenkins_test_user', region: 'us-east-1'){
                sh 'terraform plan'
                }
            }
        }
        stage('terraform Action'){
            steps {
                withAWS(credentials: 'jenkins_test_user', region: 'us-east-1'){
                sh 'terraform ${Action} -auto-approve'
                }
            }
        }
    }
}
