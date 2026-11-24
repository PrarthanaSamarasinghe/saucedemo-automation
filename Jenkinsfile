pipeline {
    agent any

    environment {
        PYTHON       = 'C:\\Users\\pmsam\\AppData\\Local\\Programs\\Python\\Python315\\python.exe'
        CHROMEDRIVER = 'C:\\jenkins\\drivers\\chromedriver.exe'
    }

    triggers {
        cron('H 2 * * *')
        pollSCM('H/5 * * * *')
    }

    stages {
        stage('Setup') {
            steps {
                bat '"%PYTHON%" -m venv .venv'
                bat '.venv\\Scripts\\python.exe -m pip install -r requirements.txt'
            }
        }

        stage('Run tests') {
            steps {
                bat '.venv\\Scripts\\python.exe -m robot -d results -v BROWSER:headlesschrome -v CHROMEDRIVER:%CHROMEDRIVER% tests'
            }
        }
    }

    post {
        always {
            robot outputPath: 'results'
        }
    }
}