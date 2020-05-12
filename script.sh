#!/bin/bash
# Miguel Angel H. <miguel51atlas@gmail.com>

## VARS
DIR='/tmp/TerraformPPC'
PN=`which python3`
VIRTUALENV="$DIR/bin/activate"
PACKAGE="aws2-wrap==1.0.2"
PROFILE=`grep profile ~/.aws/config | awk '{print $2}' | tr -d '[]'`

echo "#######################################################################"
echo "Get user profile details..."
echo $PROFILE
echo "OK!"

echo "#######################################################################"
echo "Create folder structure..."
mkdir -p $DIR
echo "OK!"

echo "#######################################################################"
echo "Call venv to previous structure"
$PN -m venv $DIR
echo "OK!"

echo "#######################################################################"
echo "Start virtualenv and install necessary packages..."
source $VIRTUALENV
pip3 install $PACKAGE
echo "OK!"

echo "Done! Now you can using SSO with terraform. Once you execute one of the below options, a new window in your browser will open to confirm some security stuff."

echo "AVAILABLE OPTIONS: "
echo ' terraform plan: aws2-wrap --profile $PROFILE --exec "terraform plan" '
echo ' terraform apply: aws2-wrap --profile $PROFILE --exec "terraform apply" '


echo "#######################################################################"
echo "Once you finish, DON'T FORGET TO DEACTIVATE YOUR ENV!!!"
echo "#######################################################################"
