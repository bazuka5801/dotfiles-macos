#!/bin/sh

find . -name ".*" -type f | xargs -I {} ln -s {} ~/
