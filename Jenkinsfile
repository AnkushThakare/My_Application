pipeline {
    agent any

    environment {
        IMAGE_NAME = "flask-devops-app"
    }

    stages {
        stage('Clone Code') {
            steps {
                git branch:'main' ,url: 'https://github.com/AnkushThakare/My_Application.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'python -m pip install --upgrade pip'
              sh 'pip install -r requirements.txt'
            }
        }

        stage('Test') {
            steps {
                // For now just check python syntax
                sh 'python -m py_compile app.py'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
              
        stage('Deploy with Ansible') {
            steps {
                dir('ansible') {
                    sh 'ansible-playbook -i hosts deploy.yml'
                }
            }
       }
     
   }
  }
