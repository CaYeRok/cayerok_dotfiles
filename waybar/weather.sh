#!/bin/bash
CITY=${WAYBAR_CITY:-""}
DATA=$(curl -s "https://wttr.in/${CITY}?format=j1")

TMP=$(echo $DATA | python3 -c "
import sys, json
d = json.load(sys.stdin)
cur = d['current_condition'][0]
desc = cur['weatherDesc'][0]['value']
tmp = cur['temp_C']
feel = cur['FeelsLikeC']
hum = cur['humidity']
days = d['weather']
out = []
for day in days:
    date = day['date']
    hi = day['maxtempC']
    lo = day['mintempC']
    desc2 = day['hourly'][4]['weatherDesc'][0]['value']
    out.append(f\"{date}  {desc2}  ↑{hi}°C ↓{lo}°C\")
tooltip = f\"{desc} {tmp}°C · feels {feel}°C · 💧{hum}%\n\" + '\n'.join(out)
print(json.dumps({'text': f'󰖔 {tmp}°C', 'tooltip': tooltip}))
")

echo $TMP
