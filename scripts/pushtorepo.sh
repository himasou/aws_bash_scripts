#!/bin/bash
REPO="https://git-codecommit.us-east-2.amazonaws.com/v1/repos"
$(aws ecr get-login --no-include-email --region us-east-2)

declare -a arr=("<repo_names>")

## now loop through the above array
for i in "${arr[@]}"
do
   cd $i &&
   rm -rf .git &&
   git init &&
   aws codecommit create-repository --repository-name $i --repository-description "-" &&
   aws ecr create-repository --repository-name $i
   git remote add origin $REPO/$i &&
   git add . &&
   git commit -m 'Initial Commit' &&
   git push origin master &&
   cd ..
done
