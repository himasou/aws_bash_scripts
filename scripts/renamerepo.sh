#!/bin/bash
set -e

declare -a arr=(  "<repo_name")

## now loop through the above array
for i in "${arr[@]}"
do
   aws codecommit update-repository-name --old-name $i --new-name old_$i &&
   aws codecommit update-repository-description --repository-name old_$i --repository-description "$i migrated to new repo"
done