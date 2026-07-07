#!/bin/bash
# Script to run ONT wf-16s Nextflow pipeline on the demo dataset

set -e

DATA_DIR="data/test_data"
OUT_DIR="results"

if [ ! -d "$DATA_DIR" ]; then
    echo "Error: Data directory '$DATA_DIR' not found. Please run ./download_data.sh first."
    exit 1
fi

echo "=== Running wf-16s pipeline using Nextflow ==="
nextflow run epi2me-labs/wf-16s \
  --fastq "$DATA_DIR" \
  --out_dir "$OUT_DIR" \
  --minimap2_by_reference \
  -profile standard

echo "=== Analysis Completed! ==="
echo "Check the report folder: $OUT_DIR"
