#!/bin/bash

if [ -z "$1" ]
then
  echo "Usage: $0 http://any.website.com"
  exit 1
fi

curl=$(which curl)

if [ -z "$curl" ]
then
  echo "curl not found."
  exit 1
fi

normal=$($curl $1 --silent --write-out "%{size_download}\n" --output /dev/null)
compressed=$($curl $1 --silent -H "Accept-Encoding: gzip,deflate" --write-out "%{size_download}\n" --output /dev/null)

if (( $compressed < $normal ))
then
  echo "Server accepts either gzip or deflate."
else
  echo "Server does not accept neither gzip nor deflate."
fi

