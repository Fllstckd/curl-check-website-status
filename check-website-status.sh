#!/bin/bash

# List of URLs to check
urls=("https://google.com" "https://example.com" "https://nonexistentwebsite.com")

echo "Checking website status..."
for url in "${urls[@]}"; do
    response=$(curl -o /dev/null -s -w "%{http_code}" "$url")
    if [ "$response" -eq 200 ]; then
        echo "$url - Active (HTTP $response)"
    else
        echo "$url - Down (HTTP $response)"
    fi
done
