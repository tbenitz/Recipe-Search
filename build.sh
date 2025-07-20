#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# Create a 'dist' directory for the final output
mkdir -p dist

# Copy the original HTML file to the dist directory
cp index.html dist/index.html

# Check if the secret key is provided
if [ -z "$MEALDBKEY" ]; then
  echo "MEALDBKEY secret is not set. Using free API."
  # Replace placeholder with an empty string if secret is not available
  sed -i "s|__MEALDB_API_KEY__|''|g" dist/index.html
else
  echo "MEALDBKEY secret found. Injecting into HTML."
  # Use sed to find the placeholder and replace it with the actual secret key
  sed -i "s|__MEALDB_API_KEY__|${MEALDBKEY}|g" dist/index.html
fi

echo "Build script finished."
