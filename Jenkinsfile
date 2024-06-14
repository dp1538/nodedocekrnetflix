pipeline {
    agent any
    stages{
        stage("checkout"){
            steps{
                checkout scm
            }
        }

        stage("Test"){
            steps{
                sh 'sudo apt install npm'
                sh 'npm test'
            }
        }

        stage("Build"){
            steps{
                sh 'npm run build'
            }
        }
        stage("Build Image"){
            steps{
                sh 'docker build -t my-node-netflix:1.0 .'
            }
        }
        stage('Docker Push') {
            steps {
        withCredentials([string(credentialsId: 'docekrhubpwd', variable: 'dockerhubpwd')]) {

                    sh 'docker login -u durgaprasad1538 -p $dockerhubpwd'
                    sh 'docker tag  my-node-netflix:1.0 durgaprasad1538/nodenetflix'
                    sh 'docker push durgaprasad1538/nodenetflix'
                    sh 'docker logout'
                }
            }
    }
}
}
