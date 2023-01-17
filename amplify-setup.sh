#!/bin/bash
set -e
IFS='|'

# Specify the headless amplify pull parameters
# https://docs.amplify.aws/cli/usage/headless/#amplify-pull-parameters
REACTCONFIG="{\
\"SourceDir\":\"src\",\
\"DistributionDir\":\"build\",\
\"BuildCommand\":\"npm run-script build\",\
\"StartCommand\":\"npm run-script start\"\
}"
AWSCLOUDFORMATIONCONFIG="{\
\"configLevel\":\"project\",\
\"useProfile\":false,\
\"profileName\":\"cds-dev\",\
\"accessKeyId\":\"AKIAYFTKF43S7JR4EXTW\",\
\"secretAccessKey\":\"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\",\
\"region\":\"eu-west-2\"\
}"
AMPLIFY="{\
\"profileName\":\"cds\",\
\"envName\":\"dev\",\
\"defaultEditor\":\"code\"\
}"
FRONTEND="{\
\"frontend\":\"javascript\",\
\"framework\":\"react\",\
\"config\":$REACTCONFIG\
}"
PROVIDERS="{\
\"awscloudformation\":$AWSCLOUDFORMATIONCONFIG\
}"

# # Create AWS credential file inside ~/.aws
# mkdir -p ~/.aws \
# && echo -e "[default]\naws_access_key_id=$AWS_ACCESS_KEY_ID\naws_secret_access_key=$AWS_SECRET_ACCESS_KEY" \
# >> ~/.aws/credentials

# # Create AWS config file ~/.aws
# echo -e "[default]\nregion=$AWS_DEFAULT_REGION" >> ~/.aws/config

# Run amplify pull in Headless mode, 
# this also generates thw aws-exports.js file inside /src

# amplify init \
# --amplify $AMPLIFY \
# --frontend $FRONTEND \
# --providers $PROVIDERS \
# --yes

amplify configure project \
--amplify $AMPLIFY \
--frontend $FRONTEND \
--providers $PROVIDERS \

amplify push -y
