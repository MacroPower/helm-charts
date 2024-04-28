#!/bin/bash

# The YAML file to be processed
input_file="input.yaml"

curl -L https://github.com/jodevsa/wireguard-operator/releases/download/v2.0.28/release.yaml > $input_file

# Find out how many documents are in the file
total_docs=$(cat $input_file | grep -E '^---' | wc -l)

echo "Total documents: $total_docs"

# Loop through each document in the YAML file
for i in $(seq 0 $total_docs); do
    # Extract the entire document
    doc=$(yq eval-all "select(document_index == $i)" $input_file)
    
    # Check if the document is empty or does not exist
    if [[ -z "$doc" ]]; then
        continue
    fi

    # Extract the Kind field, convert it to lowercase
    kind=$(echo "$doc" | yq eval '.kind' - | tr '[:upper:]' '[:lower:]')

    # Check if the Kind field was successfully extracted
    if [[ -z "$kind" ]]; then
        echo "No 'kind' field found in document $i, skipping..."
        continue
    fi

    # Determine the filename from the Kind
    filename="${kind}.yaml"

    # Check if the file already exists and prepend a separator if it does
    if [[ -f "$filename" ]]; then
        echo "---" >> "$filename"
    fi

    # Write or append the document to the appropriate file
    echo "$doc" >> "$filename"

done
