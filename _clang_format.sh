#!/bin/bash

path="${1-Shaders}"

echo "fixing encoding on $path"
find -X $path -name "*.cginc" -exec nkf -w8XZ0Lw --oc=w8 --in-place --overwrite {} \;
find -X $path -name "*.shader" -exec nkf -w8XZ0Lw --oc=w8 --in-place --overwrite {} \;

echo "mimic --reverse $path"
#find -X $path -name "*.cginc" -exec mimic --check {} \;
#find -X $path -name "*.shader" -exec mimic --check {} \;

echo "formatting $path"
find -X $path -name "*.cginc" -exec clang-format -i {} \;
find -X $path -name "*.shader" -exec clang-format -i {} \;

echo "fixing line endings on $path"
find -X $path -name "*.cginc" -exec sed 's/^M$//' {} > {} \;
find -X $path -name "*.shader" -exec sed 's/^M$//' {} > {} \;

echo "fixing file rights on $path"
find -X $path -name "*.cginc" -exec chmod 664 {} \;
find -X $path -name "*.shader" -exec chmod 664 {} \;
