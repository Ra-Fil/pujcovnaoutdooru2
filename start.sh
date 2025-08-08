#!/bin/bash
# Start script pro DigitalOcean hosting

# Kontrola environment variables
if [ -z "$DATABASE_URL" ]; then
    echo "❌ CHYBA: DATABASE_URL není nastavena!"
    echo "Nastavte environment variable DATABASE_URL před spuštěním aplikace."
    exit 1
fi

# Nastavení výchozího portu
export PORT=${PORT:-8080}
export NODE_ENV=${NODE_ENV:-production}

echo "🚀 Spouštím Půjčovnu Outdooru..."
echo "📊 Environment: $NODE_ENV"
echo "🌐 Port: $PORT"
echo "💾 Databáze: připojena"

# Spuštění aplikace
exec node index.js