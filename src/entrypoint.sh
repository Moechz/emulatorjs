#!/bin/sh
# TOS wrapper: LinuxServer s6 starts as root, chowns /config and su-execs to
# abc. Run the EmulatorJS content manager directly as uid 1000; it derives its
# home from HOME, so point it at the writable /config volume.
set -u
set -e
mkdir -p /config/profile
if [ ! -s /config/profile/profile.json ]; then
  printf '{}\n' > /config/profile/profile.json
fi
export HOME=/config
cd /emulatorjs
exec node index.js
