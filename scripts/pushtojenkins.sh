#!/bin/bash

declare -a arr=("<jenkins_job_names>")

for i in "${arr[@]}"
do
  java -jar jenkins-cli.jar -s "<jenkins_url>" -auth <jenkins_user>:<jenkins_token> create-job $i < $i.xml;
done