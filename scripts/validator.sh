#!/bin/sh

source ${PWD}/scripts/includes/variables.sh
source ${PWD}/scripts/includes/functions.sh

TYPE=( ${@} )
CONTAIN_ERROR=false

# Print information
pre_information

for i in "${!TYPE[@]}"
do
    WHICH_BIN=$(eval which ${TYPE[$i]})

    echo ${WHICH_BIN} " === " ${TYPE[$i]}
    for j in "${!binary[@]}"
    do
        if [[ -z "${WHICH_BIN}" && "${binary[@]}" =~ "${TYPE[$i]}"]]; then
            sh -c 'echo "There is no '${binary[$j]}' binary installed, follow this url to install '${binary[$j]}' '${tutorial[$j]}'"'
            # CONTAIN_ERROR=true
        fi
    done

    # if [[ -z "${WHICH_BIN}" && "${binary[@]}" =~ "${TYPE[$i]}" ]]; then
    #     sh -c 'echo "There is no '${TYPE[$i]}' binary installed, follow this url to install '${TYPE[$i]}' '${tutorial[$j]}'"'
    #     # CONTAIN_ERROR=true
    # fi
done


echo "CONTAIN_ERROR: "${CONTAIN_ERROR}

if $CONTAIN_ERROR; then
    echo "Your process force exit with code 1. Please check error message above!"
    exit 1
fi


# for i in "${!binary[@]}"
# do
#     if [[ "${binary[$i]}" == "${TYPE}" ]]; then
#         sh -c 'echo "There is no '${binary[$i]}' binary installed, follow this url to install '${binary[$i]}' '${tutorial[$i]}'" && exit 1'
#     fi
# done