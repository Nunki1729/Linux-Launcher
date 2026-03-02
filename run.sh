#!/bin/bash
# Script para abrir DragonSweeper como app en Linux
# Con perfil temporal exclusivo de Firefox
# Cierra automáticamente el servidor al cerrar la ventana del juego

GAME_PATH="$HOME/Aplicaciones/dragonsweeper"
PORT=8000

# Crear carpeta para perfil temporal (si no existe)
PROFILE_DIR="/tmp/dragonsweeper-profile"
mkdir -p "$PROFILE_DIR"

# Lanzar servidor HTTP en background y ocultar salida
python3 -m http.server $PORT --directory "$GAME_PATH" >/dev/null 2>&1 &
SERVER_PID=$!
echo "Servidor Python iniciado con PID $SERVER_PID"

# Lanzar Firefox con perfil temporal exclusivo en modo app
# --no-remote asegura que sea un proceso independiente
firefox --no-remote --profile "$PROFILE_DIR" --new-window --app="http://localhost:$PORT" >/dev/null 2>&1 &
FIREFOX_PID=$!
echo "Firefox lanzado con PID $FIREFOX_PID"

# Esperar a que se cierre la ventana del juego
while kill -0 $FIREFOX_PID 2>/dev/null; do
    sleep 1
done

# Al cerrar Firefox, cerrar el servidor Python
kill $SERVER_PID 2>/dev/null
echo "Servidor Python detenido"

# Limpiar perfil temporal
rm -rf "$PROFILE_DIR"