pipeline {
    agent { label 'maven' }

    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }

    stages {
        stage('Build and Test') {
            parallel {
                stage('hello-world') {
                    when {
                        changeset "lesson26/hello-world/**"
                    }
                    stages {
                        stage('Build') {
                            steps {
                                dir('lesson26/hello-world') {
                                    sh 'mvn clean package -DskipTests'
                                }
                            }
                        }
                        stage('Test') {
                            steps {
                                dir('lesson26/hello-world') {
                                    sh 'mvn test'
                                }
                            }
                        }
                        stage('Deploy') {
                            steps {
                                dir('lesson26/hello-world') {
                                    sh 'echo "Deploying hello-world..."'
                                }
                            }
                        }
                    }
                }
                stage('hello-jenkins') {
                    when {
                        changeset "lesson26/hello-jenkins/**"
                    }
                    stages {
                        stage('Build') {
                            steps {
                                dir('lesson26/hello-jenkins') {
                                    sh 'mvn clean package -DskipTests'
                                }
                            }
                        }
                        stage('Test') {
                            steps {
                                dir('lesson26/hello-jenkins') {
                                    sh 'mvn test'
                                }
                            }
                        }
                        stage('Deploy') {
                            steps {
                                dir('lesson26/hello-jenkins') {
                                    sh 'echo "Deploying hello-jenkins..."'
                                }
                            }
                        }
                    }
                }
                stage('hello-devops') {
                    when {
                        changeset "lesson26/hello-devops/**"
                    }
                    stages {
                        stage('Build') {
                            steps {
                                dir('lesson26/hello-devops') {
                                    sh 'mvn clean package -DskipTests'
                                }
                            }
                        }
                        stage('Test') {
                            steps {
                                dir('lesson26/hello-devops') {
                                    sh 'mvn test'
                                }
                            }
                        }
                        stage('Deploy') {
                            steps {
                                dir('lesson26/hello-devops') {
                                    sh 'echo "Deploying hello-devops..."'
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
