#! /bin/sh

set -e

sed -i "s|http://petstore.swagger.io/v2/swagger.json|$SPEC_URL|g" index.html
