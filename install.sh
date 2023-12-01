#!/bin/zsh
SOPHOS_DIR=$(mktemp -d -t Sophos_Install)
trap 'rm -rf "${SOPHOS_DIR}"' EXIT
cd "$SOPHOS_DIR" || exit

# Installing Sophos
curl -L -O "https://intranet.jfc.nl/systeembeheer/sophos/SophosInstall.zip"
unzip SophosInstall.zip
chmod a+x $SOPHOS_DIR/Sophos\ Installer.app/Contents/MacOS/Sophos\ Installer
chmod a+x $SOPHOS_DIR/Sophos\ Installer.app/Contents/MacOS/tools/com.sophos.bootstrap.helper
$SOPHOS_DIR/Sophos\ Installer.app/Contents/MacOS/Sophos\ Installer --devicegroup GP-Apple --quiet
rm -rf $SOPHOS_DIR
exit 0
