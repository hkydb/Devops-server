#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
cat > $PROP_FILE <<EOF
#Database Name - default is test
dbname=dashboarddb

#Database HostName - default is localhost
dbhost=mongodb

#Database Port - default is 27017
dbport=27017

server.contextPath=/api
server.port=8080

#API encryption key. Optional. See https://hygieia.github.io/Hygieia/setup.html#encryption-for-private-repos
#Randomly generated key	
key=DfvBg+AOGol5fOofjMdPYtpYGQ1rH4km

#Authentication Settings
# JWT expiration time in milliseconds
# Secret Key used to validate the JWT tokens
auth.authenticationProviders=STANDARD
auth.expirationTime=25000000

# Github Properties #

github.cron=${GITHUB_CRON:-}

github.host=${GITHUB_HOST:-}
github.graphqlUrl=${GITHUB_GRAPHQL_URL:-}
github.baseApiUrl=${GITHUB_BASE_API_URL:-}
github.firstRunHistoryDays=60
github.errorThreshold=100
github.rateLimitThreshold=100
github.readTimeout=60000
github.connectTimeout=30000
github.personalAccessToken=${GITHUB_PERSONAL_ACCESS_TOKEN:-}
github.notBuiltCommits[0]=(.)*(\\[maven-release-plugin\\])(.)*

github.commitPullSyncTime=604800000

github.offsetMinutes=120

github.fetchCount=100

#Randomly generated key	
github.key=DfvBg+AOGol5fOofjMdPYtpYGQ1rH4km

github.proxyUrl=${PROXY_URL:-}
github.proxyPort=${PROXY_PORT:-}
github.proxyUser=${PROXY_USERNAME:-}
github.proxyPassword=${PROXY_PASSWORD:-}

# Sonar Properties #
sonar.cron=${SONAR_CRON:-}

# Sonar server(s) (required) - Can provide multiple
sonar.servers[0]=${SONAR_HOST:-}

# Sonar version, match array index to the server. If not set, will default to version prior to 6.3.
sonar.versions[0]=${SONAR_VERSION:-}

# Sonar Metrics - Required. 
#Sonar versions lesser than 6.3
sonar.metrics[0]=${SONAR_METRICS:-}

sonar.niceNames[0]=demoSonar
# Sonar login credentials
sonar.username=${SONAR_USERNAME:-}
sonar.password=${SONAR_PASSWORD:-}

# Jenkins Properties #

jenkins.cron=${JENKINS_CRON:-}

jenkins.folderDepth:20
 #Jenkins server (required) - Can provide multiple
jenkins.servers[0]=${JENKINS_SERVER:-}
jenkins.saveLog=false
jenkins.niceNames[0]=demoJenkins
jenkins.environments[0]=DEV
# The page size
jenkins.pageSize=1000
jenkins.connectTimeout=50000
jenkins.readTimeout=50000

EOF

exec "$@"
