#
# Clean up dying pods
#
pods=$( kubectl -n <namespace> get pods | grep -v Running | tail -n +2 | awk -F " " '{print $1}' )
for pod in $pods;
do
    kubectl -n <namespace> delete pod $pod  --grace-period=0 --force
done
