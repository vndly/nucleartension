#!/usr/bin/env bash

set -e

BASE_DIR=`dirname $0`

FORMAT="json"
TOKEN="aed8e5c7-7303-4c12-be5f-299f27aeb881"
URL="https://script.google.com/macros/s/AKfycbxsYopCRt0UcVFfvLpoaPPrbgvIYKrTOdYXNELaw23QYo9LZJJcdsC-7FohlnX1ectZiA/exec"

wget -O "${BASE_DIR}/../assets/i18n/en.json" "${URL}?locale=en&format=${FORMAT}&token=${TOKEN}"

flutter pub upgrade
flutter pub pub run dalocale:dalocale.dart ./assets/i18n/ ./lib/utils/localizations.dart en ./lib
dart format lib