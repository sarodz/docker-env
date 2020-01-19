MAPPING_NAME=firefox
PORT_IN_VM=5800
PORT_FWD=5800
VBOX_NAME=default
vboxmanage controlvm $VBOX_NAME natpf1 "${MAPPING_NAME},tcp,,${PORT_IN_VM},,${PORT_FWD}"

# source: https://stackoverflow.com/questions/35372399/connect-to-docker-machine-using-localhost
