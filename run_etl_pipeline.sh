#!/bin/bash

# Exit immediately if any command fails
set -e

# configure path for conda
export PATH="/c/anaconda3/Scripts:$PATH"

# Define your Conda environment name
CONDA_ENV_NAME="venv310"

# Get the script's directory path
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
DBT_PROJECT_DIR="$SCRIPT_DIR/dbt_transformation"

# Run ETL Script
echo "Starting Python ETL script..."
conda run --name "$CONDA_ENV_NAME" python "$SCRIPT_DIR/etl_pipeline.py"

# Run DBT Transformation
echo "Starting dbt transformation..."
cd "$DBT_PROJECT_DIR"
conda run --name "$CONDA_ENV_NAME" dbt build

echo "$(date): Pipeline completed successfully."
