#!/usr/bin/env bash

## Autor: R3D4L1T basado en Aditya Shakya

dir="$HOME/.config/polybar/scripts/rofi"
rofi_command="rofi -no-config -theme $dir/networkmenu.rasi"

# Obtener la conexión activa
active_conn=$(nmcli -t -f NAME,DEVICE,TYPE,STATE connection show --active | awk -F: '$4=="activated"{print $1}')

# Listar todas las conexiones disponibles
mapfile -t connections < <(
  nmcli -t -f NAME,TYPE connection show | awk -F: '
  {
    icon = ($2 == "802-11-wireless") ? "" : 
         ($2 == "ethernet") ? "" : "";
    printf "%s %s\n", icon, $1
  }' | sort -u
)

# Si no hay conexiones, mostrar mensaje
if [[ ${#connections[@]} -eq 0 ]]; then
  echo "No se detectaron redes" | rofi -theme "$dir/message.rasi" -e
  exit 1
fi

# Mostrar menú
chosen="$(printf '%s\n' "${connections[@]}" | $rofi_command -p "Conexión activa: $active_conn" -dmenu -selected-row 0)"

# Extraer solo el nombre de la conexión elegida (sin ícono)
selected_conn=$(echo "$chosen" | sed 's/^[^ ]* //')

# Salir si no eligió nada
[[ -z "$selected_conn" ]] && exit 0

# Si ya está conectada, notificar y salir
if [[ "$selected_conn" == "$active_conn" ]]; then
  notify-send "Ya estás conectado a '$selected_conn'"
  exit 0
fi

# Intentar conectar
nmcli connection up "$selected_conn" >/dev/null 2>&1

# Notificar resultado
if [[ $? -eq 0 ]]; then
  notify-send "Conectado a '$selected_conn' ✔️"
else
  notify-send "Error al conectar a '$selected_conn' ❌"
fi

    
