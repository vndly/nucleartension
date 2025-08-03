#!/usr/bin/env bash

set -e

flutter clean
flutter pub upgrade
dart compile exe lib/main/main_remote.dart -o bin/nucleartension