#!/bin/bash
set -e
REPO="https://git-codecommit.ap-southeast-1.amazonaws.com/v1/repos"

declare -a arr=(  "<codecommit_repo_names>")

## now loop through the above array
for i in "${arr[@]}"
do
   cd $i.git &&
   aws codecommit create-repository --repository-name $i --repository-description "$i" &&
   git push --mirror https://git-codecommit.ap-southeast-1.amazonaws.com/v1/repos/$i &&
   cd ..
done