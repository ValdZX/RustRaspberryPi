#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

readonly TARGET_HOST=pi@192.168.31.70
readonly TARGET_PATH=/home/pi/RustRaspberryPi
readonly SOURCE_PATH=./target/release/RustRaspberryPi

cargo build --release
rsync ${SOURCE_PATH} ${TARGET_HOST}:${TARGET_PATH}
ssh -t ${TARGET_HOST} ${TARGET_PATH}