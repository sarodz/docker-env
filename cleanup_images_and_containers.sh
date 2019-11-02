echo "removing containers that exited within the last hour."
docker rm $(./clean/show_minutes_old.sh)
echo "removing containers that exited more than a month ago."
docker rm $(./clean/show_months_old.sh)
echo "removing images with <none> <none>"
docker rmi $(./clean/show_none.sh)
