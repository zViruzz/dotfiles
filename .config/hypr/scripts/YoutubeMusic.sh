#!/bin/bash

APP_CLASS="com.github.th_ch.youtube_music"

# Título esperado de la ventana (usualmente es este, pero confírmalo)
WINDOW_TITLE="YouTube Music"

# Comando para lanzar la aplicación
# **NOTA:** Puede que necesites cambiar esto. Prueba a lanzar la app desde la terminal.
# Podría ser 'youtube-music', 'youtube-music-desktop', o si es flatpak: 'flatpak run com.github.th_ch.youtube_music'
LAUNCH_COMMAND="youtube-music"

# Comprobar si la ventana ya existe
if hyprctl clients | grep -q "class: ${APP_CLASS}"; then
  # Si ya existe, simplemente enfoca el workspace
  hyprctl dispatch togglespecialworkspace music
else
  # Si no existe, lanza la aplicación en segundo plano
  ${LAUNCH_COMMAND} &

  # Espera a que la ventana aparezca con la clase correcta
  sleep 2
  until hyprctl clients -j | jq -e ".[] | select(.class==\"${APP_CLASS}\")"; do
    sleep 0.5
  done

  # Una vez encontrada, aplica todas las reglas
  hyprctl --batch \
    "dispatch movetoworkspace special:music,class:^(${APP_CLASS})$ ; \
         dispatch setfloating class:^(${APP_CLASS})$ ; \
         dispatch resizeactive 1200 700 ; \
         dispatch moveactive 100 100"
fi
