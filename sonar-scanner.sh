#!/bin/bash

# Carregar variáveis do arquivo sonar.env
source sonar.env

# Executar o SonarScanner em um container Docker
docker run \
--rm \
--network sonarnet \
--link sonarqube:sonarqube-server \
-e SONAR_HOST_URL="${SONARQUBE_URL}" \
-e SONAR_SCANNER_OPTS="-Dsonar.projectKey=${YOUR_PROJECT_KEY}" \
-e SONAR_TOKEN="${SONAR_TOKEN}" \
-v "$(pwd):/usr/src" \
sonarsource/sonar-scanner-cli
