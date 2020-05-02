pipeline {
    agent {
            label "docker && linux"
    } 
    stages {
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'
                script {              
                    def secrets = [
                        [path: "infastructure/gitlab", engineVersion: 2, secretValues: [
                            [envVar: 'CI_BOT_TOKEN', vaultKey: 'ci-bot']
                        ]]
                    ]           
                    withVault([configuration: [timeout: 60], vaultSecrets: secrets ]){ 
                        sh "docker login -u ci-bot -p ${CI_BOT_TOKEN} registry.oskk.1solution.ru"
                        def customImage = docker.build("registry.oskk.1solution.ru/docker-images/mono-docker:latest")
                        customImage.push()
                    }
                }          
            }
        }
    }
}