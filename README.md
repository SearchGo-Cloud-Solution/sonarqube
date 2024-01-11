# Requirements
- docker
- docker-compose
- bash

# Instalation
1. Clone this repository to your local machine.
2. Run as current user `docker-compose up -d` in the root directory of the project.
3. Run as root `cp sonar-scanner.sh /usr/local/bin/sonar-scanner` to make the script available globally.
4. Run as root `chmod +x /usr/local/bin/sonar-scanner` to make the script executable.
5. Run as current user `echo 'alias sonar-scanner="/usr/local/bin/sonar-scanner" >> "~/.bashrc"'` to make the script available globally.
6. Run as current user `source ~/.bashrc` to reload the bashrc file.

# Preparing project for analysis
1. Navigate to the root directory of the project you want to analyze.
2. Create file sonar.env and add on gitignore.
3. Add the following variables to the sonar.env file:
    - SONARQUBE_URL=http://sonarqube-server:9000
    - YOUR_PROJECT_KEY=test-devops
    - SONAR_TOKEN=sqp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

# Running analysis
1. Run as current user `sonar-scanner` in the root directory of the project.
