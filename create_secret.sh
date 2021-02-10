#!/bin/sh

#======================================================================================================================
# Title         : create_secret.sh
# Description   : Create A Docker Secret With User Prompt
# Author        : Mark Dumay
# Date          : February 10th, 2021
# Version       : 1.0.1
# Usage         : ./create_secret.sh [OPTIONS] SECRET
# Repository    : https://github.com/markdumay/docker-secret.git
#======================================================================================================================

#=======================================================================================================================
# Variables
#=======================================================================================================================
name=''


#======================================================================================================================
# Helper Functions
#======================================================================================================================

# Display usage message
usage() { 
    echo "Usage: $0 [OPTIONS] SECRET" 1>&2; 
    echo "" 1>&2;
    echo "Create a Docker secret from a prompt as content" 1>&2;
    echo "" 1>&2;
    echo "Options:" 1>&2;
    echo "  -d, --driver string            Secret driver" 1>&2;
    echo "  -l, --label list               Secret labels" 1>&2;
    echo "      --template-driver string   Template driver" 1>&2;
    echo "" 1>&2;
}


#======================================================================================================================
# Workflow Functions
#======================================================================================================================

# Read secret string, original code by Susam Pal at https://stackoverflow.com/a/28393320
read_secret() {
    # Disable echo
    stty -echo

    # Set up trap to ensure echo is enabled before exiting if the script
    # is terminated while echo is disabled
    trap 'stty echo' EXIT

    # Read secret
    read -r "$@"

    # Enable echo
    stty echo
    trap - EXIT

    # Print a newline because the newline entered by the user after
    # entering the passcode is not echoed. This ensures that the
    # next line of output begins at a new line.
    echo
}


#======================================================================================================================
# Main Script
#======================================================================================================================


#=======================================================================================================================
# Main Script
#=======================================================================================================================

#=======================================================================================================================
# Entrypoint for the script.
#=======================================================================================================================
main() {
    # Store and validate command-line arguments
    args="$*"
    while [ "$1" != "" ]; do
        case $1 in
            # note: -d | --driver | -l | --label | --template-driver are passed to 'docker secret create'
            -d | --driver | -l | --label | --template-driver )
                shift
                ;;
            -h | --help )
                usage
                exit
                ;;
            -* )
                usage
                exit 1
                ;;
            * )
                name="$1"
        esac
        shift
    done

    # Validate secret name is provided
    if [ -z "${name}" ] ; then
        usage
        exit 1
    fi

    # Read the secret
    printf "Secret: "
    secret=''
    read_secret secret

    # Pass secret to Docker
( cat <<EOF
${secret}
EOF
) | docker secret create "${args}" -
}

main "$@"