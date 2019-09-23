#!/bin/bash

# Initialize basic vars and helpers
source blueprint-lib/init.sh

##
# Add dependencies here
##

# source blueprint-lib/docker.sh

##
# ADD BLUEPRINT CODE BELOW HERE
#
# BASE_PATH is the full path to the project root
# APP_NAME is the name of the Django app that will be modified
##

BLUEPRINT="MessagingBlueprint"

EXT_POINT_1="@BlueprintInsertion"
EXT_POINT_2="@BlueprintImportInsertion"
EXT_POINT_3="@BlueprintNavigationInsertion"
DATA_1="{ name: '${BLUEPRINT}', human_name: '${BLUEPRINT}', access_route: '${BLUEPRINT}'},"
DATA_2="import { ${BLUEPRINT}Navigator } from '..\/features\/${BLUEPRINT}\/navigator';"
DATA_3="${BLUEPRINT}: { screen: ${BLUEPRINT}Navigator },"

echo "create blueprint folder"
mkdir -p $APP_NAME/src/features/$BLUEPRINT

echo "copy"
cp -r ./$BLUEPRINT/. $APP_NAME/src/features/$BLUEPRINT

echo ">> insert 1" 
sed -i "s/${EXT_POINT_1}/&\n${DATA_1}/g" $APP_NAME/src/config/installed_blueprints.js


echo ">> insert 2"
sed -i "s/${EXT_POINT_2}/&\n${DATA_2}/g" $APP_NAME/src/navigator/mainNavigator.js

echo ">> insert 3"
sed -i "s/${EXT_POINT_3}/&\n${DATA_3}/g" $APP_NAME/src/navigator/mainNavigator.js
