#!/bin/bash
# Script to download and extract official ONT wf-16s demo data

set -e

DATA_DIR="data"
TAR_FILE="wf-16s-demo.tar.gz"
URL="https://ont-exd-int-s3-euwst1-epi2me-labs.s3.amazonaws.com/wf-16s/wf-16s-demo.tar.gz"

echo "=== Creating data directory: $DATA_DIR ==="
mkdir -p "$DATA_DIR"

echo "=== Downloading demo dataset ==="
if [ -f "$TAR_FILE" ]; then
    echo "$TAR_FILE already exists, skipping download."
else
    curl -L -o "$TAR_FILE" "$URL"
fi

echo "=== Extracting dataset ==="
tar -xzvf "$TAR_FILE" -C "$DATA_DIR" --strip-components=1

echo "=== Done! Demo data ready in directory: $DATA_DIR ==="
ls -lah "$DATA_DIR"
