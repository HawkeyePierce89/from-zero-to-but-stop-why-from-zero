#!/bin/bash
set -e  # если ошибка — сразу выходим

rm -f arraydemo

cobc -x arraydemo.cob

./arraydemo
