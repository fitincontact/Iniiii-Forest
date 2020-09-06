#!/bin/bash
path=${PWD}
parentdir="$(basename "$(dirname "$path")")"
cd ../work
zip -r ../game/$parentdir.love *