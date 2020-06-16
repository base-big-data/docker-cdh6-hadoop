#/bin/env bash

function loop_exec()
{
    local ex_count=0
    CMDLINE=$1
    echo ${CMDLINE}
    while true ; do
        #command
        sleep 1
        echo The command is \"$CMDLINE\"
        sh -c "${CMDLINE}"
        if [ $? -eq 0 ] ; then
            echo The command execute OK!
            break;
        else
            (( ex_count = ${ex_count} + 1 ))
            echo ERROR : The command execute fialed! ex_count = ${ex_count}.
        fi
    done
}