#!/bin/bash

swift build -c release
cd .build/release
cp -f xcode-timing /usr/local/bin/xcode-timing

