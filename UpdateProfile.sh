#!/bin/sh

cd `dirname "$0"`
SCRIPT_FOLDER=`pwd`
cd "$SCRIPT_FOLDER/.."

# PROFILE_NAME should be one of AdHoc/AppStore/InHouse

PROFILE_NAME="$1"
ROOT_USER_FOLDER=`echo ~`
PROFILES_FOLDER="$ROOT_USER_FOLDER/Library/MobileDevice/Provisioning Profiles"

#rm -rf "$PROFILES_FOLDER"
mkdir -p "$PROFILES_FOLDER"
"$SCRIPT_FOLDER/NetpulseProfilesCleaner" "$PROFILES_FOLDER"

if [ -f "CurrentBrand/Profiles/$PROFILE_NAME.mobileprovision" ]; then
	cp -f "CurrentBrand/Profiles/$PROFILE_NAME.mobileprovision" "$PROFILES_FOLDER"
else
	cp -f "Profiles/$PROFILE_NAME.mobileprovision" "$PROFILES_FOLDER"
fi
