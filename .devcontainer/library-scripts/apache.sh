# Syntax: ./apache.sh [variant]

set -e

if [[ ${1} == *"apache"* ]]; then 
  sed -i -e "s/Listen 80/Listen 8000/g" /etc/apache2/ports.conf;
  sed -i -e "s/*:80/*:8000/g" /etc/apache2/sites-enabled/000-default.conf;
fi