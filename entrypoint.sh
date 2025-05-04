#!/bin/bash
echo "Executing exec /home/vintagestory/server/server.sh start"
/home/vintagestory/server/server.sh start
exec tail -f /dev/null