#!/bin/sh

echo 'Removing webapp exploded directory...'
rm -R flex-ems-server/target/flex-ems-server

echo 'Compiling project...'

mvn -e -o -Dmaven.test.skip=true install
