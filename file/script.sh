#!/bin/bash

# Exit if any command fails
set -e

# Bucket Name with timestamp
BUCKET_NAME="anas-cli-bucket-$(date +%s)"

# File from local system
FILE_NAME="backup-with-name-change.sh"

echo "[INFO] Starting AWS S3 Automation..."

# Check if file exists
if [ ! -f "$FILE_NAME" ]; then
  echo "[ERROR] File not found!"
  exit 1
fi

echo "[INFO] Creating Bucket..."
aws s3 mb s3://$BUCKET_NAME

echo "[INFO] Uploading File..."
aws s3 cp $FILE_NAME s3://$BUCKET_NAME/

echo "[INFO] Listing Bucket Objects..."
aws s3 ls s3://$BUCKET_NAME

echo "[INFO] Deleting Bucket (with contents)..."
aws s3 rb s3://$BUCKET_NAME --force

echo "[SUCCESS] Automation Completed 🚀"
