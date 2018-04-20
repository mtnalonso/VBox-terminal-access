#!/bin/bash

MACHINE_NAME="Virtual machine name"
SSH_PORT=2222

function start_vm {
    VBoxManage startvm $MACHINE_NAME --type headless
}

function stop_vm {
    VBoxManage controlvm $MACHINE_NAME acpipowerbutton
}

function is_machine_running {
    VBoxManage list runningvms | grep -c "$MACHINE_NAME"
}

function connect_vm {
    ssh -p $SSH_PORT localhost
}

if [ $(is_machine_running) -eq 0 ]; then
    start_vm
    echo -e "\nStarting guest OS . . .\n"
    connect_vm
else
    connect_vm
fi
