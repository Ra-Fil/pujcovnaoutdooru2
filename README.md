# Půjčovna Outdooru - Produkční Balíček

## 🚀 Rychlá instalace na DigitalOcean

### Metoda 1: DigitalOcean App Platform (Doporučeno)

1. **Nahrajte soubory**:
   - Rozbalte tento balíček do Git repository
   - Pushněte na GitHub/GitLab

2. **Vytvořte aplikaci**:
   - Jděte na [DigitalOcean App Platform](https://cloud.digitalocean.com/apps)
   - Klikněte "Create App" → "GitHub/GitLab"
   - Vyberte váš repository

3. **Nakonfigurujte**:
   - **Build Command**: `npm install`
   - **Run Command**: `npm start`
   - **HTTP Port**: `8080`

4. **Přidejte databázi**:
   - V App Platform klikněte "Add Database"
   - Vyberte PostgreSQL
   - Automaticky se nastaví `DATABASE_URL`

### Metoda 2: DigitalOcean Droplet (VPS)

1. **Připojte se k serveru**:
   ```bash
   ssh root@your-server-ip
   ```

2. **Nainstalujte Node.js**:
   ```bash
   curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
   apt-get install -y nodejs
   ```

3. **Nahrajte aplikaci**:
   ```bash
   cd /var/www/
   # Nahrajte soubory zde (SCP/SFTP)
   ```

4. **Nainstalujte závislosti**:
   ```bash
   npm install --production
   ```

5. **Nastavte environment variables**:
   ```bash
   export DATABASE_URL="postgresql://user:pass@host:5432/db"
   export NODE_ENV=production
   export PORT=8080
   ```

6. **Spusťte aplikaci**:
   ```bash
   chmod +x start.sh
   ./start.sh
   ```

## 🔧 Konfigurace

### Environment Variables
```bash
# POVINNÉ
DATABASE_URL=postgresql://user:pass@host:5432/dbname

# VOLITELNÉ
NODE_ENV=production
PORT=8080
SESSION_SECRET=your-secret-key
```

### Databáze
Aplikace je kompatibilní s:
- **Neon.tech** (zdarma) - `postgresql://user:pass@host.neon.tech/db`
- **DigitalOcean Managed Database**
- **Supabase** (zdarma)
- **ElephantSQL**

## 📦 Obsah balíčku
- `index.js` - Hlavní server aplikace (bundled)
- `public/` - Frontend aplikace (React build)
- `shared/` - Sdílené typy a schéma
- `package.json` - Produkční závislosti
- `start.sh` - Start script s kontrolami
- `app.yaml` - DigitalOcean App Platform konfigurace

## 🌐 Po spuštění
- Aplikace bude dostupná na portu **8080**
- Admin rozhraní: `/admin`
- API endpointy: `/api/*`

## 🔐 Doporučení pro produkci
1. Nastavte silný `SESSION_SECRET`
2. Použijte HTTPS (Let's Encrypt)
3. Nastavte monitoring (PM2 při VPS)
4. Pravidelně zálohujte databázi

## 🆘 Pomoc
- Ověřte, že je `DATABASE_URL` správně nastavena
- Zkontrolujte, že port 8080 není blokován
- Aplikace potřebuje PostgreSQL databázi

**Aplikace je ready-to-deploy bez dalších úprav!**