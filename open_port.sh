MAPPING_NAME=nameformapping
PORT_IN_VM=8888
PORT_FWD=80
VBOX_NAME=default
vboxmanage controlvm $VBOX_NAME --natpf1 "$MAPPING_NAME,tcp,,$PORT_IN_VM,,$PORT_FWD"
