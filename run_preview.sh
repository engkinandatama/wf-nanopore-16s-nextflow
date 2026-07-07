#!/bin/bash
# Script to preview the Nextflow wf-16s pipeline without running actual computations

set -e

DATA_DIR="data/test_data"

if [ ! -d "$DATA_DIR" ]; then
    echo "Error: Data directory '$DATA_DIR' not found. Please run ./download_data.sh first."
    exit 1
fi

echo "=== Running Nextflow Preview (Dry Run) ==="
nextflow run epi2me-labs/wf-16s \
  --fastq "$DATA_DIR" \
  --out_dir results_preview \
  --minimap2_by_reference \
  -profile standard \
  -preview

echo "=== Preview Completed Successfully! ==="
