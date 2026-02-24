#!/bin/bash
set -euo pipefail

#!/bin/bash

echo "Stopping application..."

pkill -f app.py

echo "Application stopped."
