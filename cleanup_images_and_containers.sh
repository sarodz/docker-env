echo "removing containers that are minutes old."
docker rm $(./show_minutes_old.sh)
echo "removing containers that are months old."
docker rm $(./show_months_old.sh)
echo "removing images with <none> <none>"
docker rmi $(./show_none.sh)
