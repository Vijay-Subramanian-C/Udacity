#!/bin/bash
# Automation script for CloudFormation templates. 
#
# Parameters
#   $1: Execution mode. Valid values: deploy, delete, preview.
#
# Usage examples:
#   ./run.sh deploy 
#   ./run.sh preview
#   ./run.sh delete
#

# Validate parameters
if [[ $1 != "deploy" && $1 != "delete" && $1 != "preview" ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: deploy, delete, preview." >&2
    exit 1
fi

# Execute CloudFormation CLI
if [ $1 == "deploy" ]
then
    aws cloudformation deploy \
        --stack-name $2 \
        --template-file $3 \
        --capabilities "CAPABILITY_NAMED_IAM"
fi
if [ $1 == "delete" ]
then
    echo "Deleting the stack."
    aws cloudformation delete-stack --stack-name $2
fi
if [ $1 == "preview" ]
then
    aws cloudformation deploy \
        --stack-name $2 \
        --template-file $3 \
        --capabilities "CAPABILITY_NAMED_IAM"
        --no-execute-changeset
fi