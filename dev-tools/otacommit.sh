#!/bin/bash

### Little Android Build Script
### Copyright 2017, Tab Fitts

# green = confirmations, blue = informational
CLR_RST=$(tput sgr0)                        ## reset flag
CLR_BLD_GRN=$CLR_RST$CLR_BLD$(tput setaf 2) #  green, bold
CLR_BLD_BLU=$CLR_RST$CLR_BLD$(tput setaf 4) #  blue, bold

echo " "
echo "${CLR_BLD_BLU}Updating OTA XML.${CLR_RST}"
echo " "

source config.conf

cd $OTAPATH && git reset --hard && git fetch && git pull

sed -i -- 's/'"<VersionName"'.\+<\/\VersionName>/'"\<VersionName>$OTA_VERSION<\/\VersionName>"'/g' $OTAXML
sed -i -- 's/'"$ROMPREFIX\_"'.\+zip/'"$FILENAME"'/g' $OTAXML
sed -i -- 's/'"$ROMPREFIX\_"'.\+txt/'"$CHANGELOG"'/g' $OTAXML
sed -i -- 's/'"<FileSize"'.\+<\/\FileSize>/'"\<FileSize type=\"\integer\"\>$FILESIZE<\/\FileSize>"'/g' $OTAXML
sed -i -- 's/'"<VersionNumber"'.\+<\/\VersionNumber>/'"\<VersionNumber type=\"\string\"\>$OTA_NUMBER<\/\VersionNumber>"'/g' $OTAXML

sed -i -- 's/'"<CheckMD5"'.\+<\/\CheckMD5>/'"\<CheckMD5>$MD5<\/\CheckMD5>"'/g' $OTAXML
echo " "

# Check if variables are unset or empty
if [ -z "$FILENAME" ] || [ -z "$MD5SUMNAME" ] || [ -z "$CHANGELOG" ] || [ -z "$FILESIZE" ] || [ -z "$MD5" ] || [ -z "$OTA_VERSION" ] || [ -z "$OTA_NUMBER" ]
then
    echo "${CLR_BLD_RED}Some variables are unset or empty. Exiting...${CLR_RST}"
    exit 1
fi

echo "${CLR_BLD_BLU}Committing and pushing changes${CLR_RST}"

git commit $OTAXML -m "'$OTACOMMITMSG'" && git push $OTAREPO

echo "${CLR_BLD_GRN}Update of OTA XML complete.${CLR_RST}"
