#!/bin/bash

APP_PATH="PUT THE LOCATION OF YOUR FILE, FOR EXAMPLE: /home/user_name/applications/my_application"
PORT=8000

# Create a temporal folder for the porfile
PROFILE_DIR="/tmp/temp_html_app_folder"
mkdir -p "$PROFILE_DIR"

# Run HTTP server in the background and hide the output
python3 -m http.server $PORT --directory "$APP_PATH" >/dev/null 2>&1 &
SERVER_PID=$!
echo "Servidor Python iniciado con PID $SERVER_PID"

# Launch Firefox with a temporary, exclusive profile in app mode
firefox --no-remote --profile "$PROFILE_DIR" --new-window --app="http://localhost:$PORT" >/dev/null 2>&1 &
FIREFOX_PID=$!
echo "Firefox lanzado con PID $FIREFOX_PID"

# Wait for the game window to close
while kill -0 $FIREFOX_PID 2>/dev/null; do
    sleep 1
done

# When Firefox closes, shut down the Python server
kill $SERVER_PID 2>/dev/null
echo "Servidor Python detenido"

# Clean up temporary profile
rm -rf "$PROFILE_DIR"
