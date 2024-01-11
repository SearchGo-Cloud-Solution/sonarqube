#!/bin/bash

# Load variables from sonar.env file
source sonar.env

# Run SonarScanner in a Docker container
docker run \
--rm \
--network sonarnet \
--link sonarqube:sonarqube-server \
-e SONAR_HOST_URL="${SONARQUBE_URL}" \
-e SONAR_SCANNER_OPTS="-Dsonar.projectKey=${YOUR_PROJECT_KEY}-$2 -Dsonar.projectVersion=$1" \
-e SONAR_TOKEN="${SONAR_TOKEN}" \
-v "$(pwd):/usr/src" \
sonarsource/sonar-scanner-cli
