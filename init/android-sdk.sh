
appsroot=/iasj/apps/apps
appsbash=/iasj/apps/bash
# Android Development Kit

GOOGLE="https://dl.google.com/android/repository"
pack="commandlinetools-linux-11076708_latest.zip"
URL="$GOOGLE/$pack"
ANDROID_HOME=$appsroot/android-sdk
ANDROID_PATH="\$ANDROID_HOME/cmdline-tools/latest/bin"
pack=$appsroot/../imag/$pack

if test ! -f "$pack";then
  echo "getting $pack"
  curl --silent -o $pack $URL
fi
dest=$ANDROID_HOME/cmdline-tools
if test -d $dest;then rm -r $dest;fi
mkdir -p $dest
echo "Extracting to $dest/latest"
if test -d cmdline-tools;then rm -rf cmdline-tools;fi
unzip -qqu $pack
mv cmdline-tools $dest/latest

sdkmanager=$dest/latest/bin/sdkmanager

echo "Installing build-tools;35.0.0-rc4"
yes|$sdkmanager "build-tools;35.0.0-rc4" > /dev/null

echo "Installing platform-tools"
yes|$sdkmanager "platform-tools" > /dev/null

echo "Installing platforms;android-35"
yes|$sdkmanager "platforms;android-35" > /dev/null

echo "Installing ndk;27.0.12077973"
yes|$sdkmanager "ndk;27.0.12077973" > /dev/null

if grep "android-sdk" $appsbash > /dev/null;then exit 0;fi
echo "# Application: android-sdk {">>$appsbash
echo >> $appsbash

echo "export ANDROID_HOME=$ANDROID_HOME">>$appsbash
echo "export PATH+=:$ANDROID_PATH" >>$appsbash

echo >> $appsbash
ANDROID_BUILD_TOOLS="\$ANDROID_HOME/build-tools/35.0.0-rc4"
echo "ANDROID_BUILD_TOOLS=$ANDROID_BUILD_TOOLS">>$appsbash
echo "export PATH+=:\$ANDROID_BUILD_TOOLS">>$appsbash

echo >> $appsbash
ANDROID_PLATF_TOOLS="\$ANDROID_HOME/platform-tools"
echo "ANDROID_PLATF_TOOLS=$ANDROID_PLATF_TOOLS">>$appsbash
echo "export PATH+=:\$ANDROID_PLATF_TOOLS">>$appsbash

echo >> $appsbash
echo "unset ANDROID_BUILD_TOOLS">>$appsbash
echo "unset ANDROID_PLATF_TOOLS">>$appsbash

echo >> $appsbash
echo "# end-android-sdk }">>$appsbash

sh $appsroot/../init/fix.sh
