#!/bin/bash

declare -a arr=("<codecommit_repo_names>")

for i in "${arr[@]}"
do
  kubectl -n vlife logs -f $i > $i.log
done
