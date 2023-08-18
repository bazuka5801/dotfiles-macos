#!/bin/sh

find . -name ".*" -type f -execdir echo {} ';' | xargs -I {} ln -s $(pwd)/{} ~/
