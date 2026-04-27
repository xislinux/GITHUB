#!/bin/bash

echo "=========================================="
echo "🔄 Reassembling Minecraft Server"
echo "=========================================="

# Check if all parts exist
for i in 1 2 3 4 5; do
  if [ ! -f "server-part-$i-of-5.tar.gz" ]; then
    echo "❌ Missing: server-part-$i-of-5.tar.gz"
    echo "Make sure all 5 parts are in the same directory"
    exit 1
  fi
done

echo "✅ All 5 parts found"
echo "📦 Combining parts..."

# Combine all parts
cat server-part-1-of-5.tar.gz \
    server-part-2-of-5.tar.gz \
    server-part-3-of-5.tar.gz \
    server-part-4-of-5.tar.gz \
    server-part-5-of-5.tar.gz > server-full.tar.gz

echo "📂 Extracting..."
tar xzf server-full.tar.gz

echo "🧹 Cleaning up..."
rm server-full.tar.gz

echo ""
echo "✅ SERVER READY!"
echo ""
echo "🎮 To start your Slimefun server:"
echo "   cd server"
echo "   java -jar paper.jar --nogui"
echo ""
echo "   (remove --nogui for GUI window)"
echo "=========================================="
