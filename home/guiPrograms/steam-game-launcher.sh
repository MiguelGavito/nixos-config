#!/usr/bin/env bash
# Steam game launcher for blind navigation

# List installed games
echo "=== Installed Steam Games ==="
find ~/.steam/steam/steamapps -name "*.acf" -exec grep -H "name" {} \; | \
  sed 's/.*appmanifest_/AppID: /' | \
  sed 's/.acf.*"name"/ | Game: /'

echo ""
echo "To launch a game:"
echo "  steam steam://rungameid/APPID"
echo ""
echo "Or use wofi to search and launch:"
echo "  wofi --show run"
