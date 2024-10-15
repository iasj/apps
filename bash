
# Application: biny {

export PATH+=:/iasj/apps/biny

#  end-biny }
# Application: android-sdk {

export ANDROID_HOME=/iasj/apps/apps/android-sdk
export PATH+=:$ANDROID_HOME/cmdline-tools/latest/bin

ANDROID_BUILD_TOOLS=$ANDROID_HOME/build-tools/35.0.0-rc4
export PATH+=:$ANDROID_BUILD_TOOLS

ANDROID_PLATF_TOOLS=$ANDROID_HOME/platform-tools
export PATH+=:$ANDROID_PLATF_TOOLS

unset ANDROID_BUILD_TOOLS
unset ANDROID_PLATF_TOOLS

# end-android-sdk }
# Application: imux {

complete -W "$(ls ~/.config/imux)" imux

# end-imux }
# miscellaneous:  {

complete -W "github gitlab iasj nvpm home imux devl menu" gpush
complete -W "github gitlab iasj nvpm home imux devl menu" gclone

# end-imux }
# vim: ft=bash
