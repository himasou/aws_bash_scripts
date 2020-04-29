#!/bin/bash
#IFS for jobs with spaces.
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for i in $(java -jar jenkins-cli.jar -s "<Jenkins_url>/" -auth ``<jenkins_username>``:<jenkins_token> list-jobs);
do
  java -jar jenkins-cli.jar -s "<Jenkins_url>/" -auth <jenkins_username>:<jenkins_token> get-job ${i} > ${i}.xml;
done
IFS=$SAVEIFS
mkdir deploy
tar cvfj "jenkins-jobs.tar.bz2" ./*.xml