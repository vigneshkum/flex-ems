#!/bin/sh

echo 'Start flex-ems-server'

mvn -o -Dmaven.test.skip=true jetty:run-exploded