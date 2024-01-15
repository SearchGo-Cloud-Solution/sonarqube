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
1. Open the sonar interface in the browser at http://localhost:9000.
2. Login with the default credentials: admin/admin.
3. Navigate to the My Account page.
4. On the Security tab, generate a token for the Global Analisis Token with never expires.
5. Copy the token generated in the previous step.
6. Create a new Local project as in the example below:
    - Project Name: test-devops-<BRANCH_TARGET>
    - Project Key: test-devops-<BRANCH_TARGET>
    - Main Branch Name: <BRANCH_TARGET> 
7. Navigate to the root directory of the project you want to analyze.
8. Create file sonar.env.
9. Add the following variables to the sonar.env file:
    - SONARQUBE_URL=http://sonarqube-server:9000
    - YOUR_PROJECT_KEY=test-devops
    - SONAR_TOKEN=<TOKEN_GENERATED_IN_STEP_5>
10. Add on .gitignore file the following line:
    - .scannerwork
    - *sonar.env


# Running analysis
1. Run as current user `sonar-scanner PROJECT_VERSION_SCANNING` in the root directory of the project:
    - PROJECT_VERSION_SCANNING: version of the project to be analyzed. Allowing to identify the version of the project in the sonar interface.

# Running analysis automatically before each push
1. Run as current user `cp pre-push .git/hooks/pre-push` in the root directory of the project.
2. Run as current user `chmod +x .git/hooks/pre-push` in the root directory of the project.
