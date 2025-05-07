#!/bin/bash

# Get the script directory to save the output at the root level
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define the output file path
DEFAULTS_FILE="$SCRIPT_DIR/defaults_settings.sh"

echo "Creating macOS defaults settings script at $DEFAULTS_FILE"

# Get a list of all preference domains
all_domains=$(defaults domains | tr ',' '\n' | sed 's/^[ \t]*//')

# Only include specific domains that the user wants
domains=()

# Create the main defaults file
echo "#!/bin/bash" > "$DEFAULTS_FILE"
echo "" >> "$DEFAULTS_FILE"
echo "# macOS defaults settings exported on $(date)" >> "$DEFAULTS_FILE"
echo "# Run this script on a new machine to apply your preferred settings" >> "$DEFAULTS_FILE"
echo "" >> "$DEFAULTS_FILE"

# Only include specific domains that the user wants
common_domains=(
  "com.apple.dock"
  "com.apple.finder"
  "com.apple.desktopservices"
)

# Process common domains first
for domain in "${common_domains[@]}"; do
  echo "" >> "$DEFAULTS_FILE"
  echo "# $domain settings" >> "$DEFAULTS_FILE"
  echo "" >> "$DEFAULTS_FILE"
  
  # Read the domain's defaults directly without creating plist files
  defaults_output=$(defaults read "$domain" 2>/dev/null)
  
  # If we successfully read the domain, add its settings to our script
  if [ $? -eq 0 ]; then
    echo "$defaults_output" | grep -v '    };$' | grep "=" | while read line; do
      key=$(echo "$line" | awk -F" = " '{print $1}' | sed 's/^[ \t]*//' | sed 's/;$//')
      value=$(echo "$line" | awk -F" = " '{$1=""; print $0}' | sed 's/^[ \t]*//' | sed 's/;$//')
      
      # Clean up the key and value
      key=$(echo "$key" | sed 's/"//g')
      
      echo "defaults write \"$domain\" \"$key\" $value" >> "$DEFAULTS_FILE"
    done
  fi
done

# Process remaining domains
for domain in "${domains[@]}"; do
  # Skip domains we've already processed
  if [[ " ${common_domains[@]} " =~ " ${domain} " ]]; then
    continue
  fi
  
  # Skip system domains that might cause issues
  if [[ $domain == com.apple.security* ]] || [[ $domain == com.apple.systempreferences* ]]; then
    continue
  fi
  
  echo "" >> "$DEFAULTS_FILE"
  echo "# $domain settings" >> "$DEFAULTS_FILE"
  echo "" >> "$DEFAULTS_FILE"
  
  # Read the domain's defaults directly without creating plist files
  defaults_output=$(defaults read "$domain" 2>/dev/null)
  
  # If we successfully read the domain, add its settings to our script
  if [ $? -eq 0 ]; then
    echo "$defaults_output" | grep -v '    };$' | grep "=" | while read line; do
      key=$(echo "$line" | awk -F" = " '{print $1}' | sed 's/^[ \t]*//' | sed 's/;$//')
      value=$(echo "$line" | awk -F" = " '{$1=""; print $0}' | sed 's/^[ \t]*//' | sed 's/;$//')
      
      # Clean up the key and value
      key=$(echo "$key" | sed 's/"//g')
      
      echo "defaults write \"$domain\" \"$key\" $value" >> "$DEFAULTS_FILE"
    done
  fi
done

# Add a section for killall commands to apply changes
echo "" >> "$DEFAULTS_FILE"
echo "# Apply changes by restarting affected services" >> "$DEFAULTS_FILE"
echo "killall Finder" >> "$DEFAULTS_FILE"
echo "killall Dock" >> "$DEFAULTS_FILE"
echo "killall SystemUIServer" >> "$DEFAULTS_FILE"

# Make the file executable
chmod +x "$DEFAULTS_FILE"

echo "Defaults settings script completed. You can find it at $DEFAULTS_FILE"
echo "To use this script on a new machine, copy it over and run it."
