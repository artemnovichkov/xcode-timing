#!/bin/bash

SOURCE_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
"$SOURCE_DIR/.build/release/xcode-timing" end
