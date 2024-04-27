pipeline {

    // agent {
    //     label 'ec2'
    // }

    agent any 

    tools {
        maven 'khaled'
    }

    environment {
        USER_NAME   =  "khaledeldsoky"
        EMAIL       =  "khlaedmohamedeldsoky@gmail.com"
    }

    parameters {
        string(name: 'GIT_COMMIT_REV', defaultValue: env.GIT_COMMIT_REV)
    }

    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Source Code') {
            steps {
                git branch: 'cd', url: 'https://github.com/khaledeldsoky/DevOps_project.git'
            }
        }
        
        stage('Read Commit Hash') {
            steps {
                script {
                    def commit_hash = readFile(file: "../ci/commit.txt")
                    env.GIT_COMMIT_REV = commit_hash
                }
            }
        }

        stage('Push Changes to GitHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: "github_token", usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
                    sh """
                    sh image_tag.sh app/deployment.yml ${params.GIT_COMMIT_REV}
                    git config --global user.name ${USER_NAME}
                    git config --global user.email ${EMAIL}
                    git add .
                    git commit -m "from git commit ${params.GIT_COMMIT_REV}"
                    git push https://${PASSWORD}@github.com/khaledeldsoky/DevOps_project.git HEAD:cd
                    """
                }
            }
        }


    }
}
