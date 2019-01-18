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
  ratio=$(echo "scale=2;1 - ($compressed / $normal)" | bc)
  echo "The web server compresses the response at $ratio ratio."
else
  echo "The web server doesn't compress the response."
fi

