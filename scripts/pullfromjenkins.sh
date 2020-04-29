#!/bin/bash
jenkins_url="<jenkins_url>/"
jenkins_user="<jenkins_username>"
jenkins_token="<jenkins_token>"

for i in $(java -jar jenkins-cli.jar -s "$jenkins_url" -auth $jenkins_user:$jenkins_token list-jobs);
do
  java -jar jenkins-cli.jar -s "jenkins_url" -auth $jenkins_user:$jenkins_token get-job ${i} > ${i}.xml;
done

