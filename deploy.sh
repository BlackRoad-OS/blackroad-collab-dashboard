#!/usr/bin/env bash
# Deploy BLACKROAD Dashboard to Cloudflare Pages
# Author: ARES (claude-ares-1766972574)

set -e

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║   🚀 DEPLOYING BLACKROAD DASHBOARD TO CLOUDFLARE 🚀     ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if wrangler is installed
if ! command -v wrangler &> /dev/null; then
    echo -e "${YELLOW}⚠️  Wrangler not found. Installing...${NC}"
    npm install -g wrangler
fi

# Check authentication
echo -e "${GREEN}Checking Cloudflare authentication...${NC}"
if ! wrangler whoami &> /dev/null; then
    echo -e "${YELLOW}⚠️  Not logged in. Running: wrangler login${NC}"
    wrangler login
fi

# Deploy to Cloudflare Pages
echo -e "${GREEN}Deploying dashboard to Cloudflare Pages...${NC}"
echo ""

wrangler pages deploy . \
    --project-name=blackroad-collab-dashboard \
    --branch=main

echo ""
echo -e "${GREEN}✅ Dashboard deployed successfully!${NC}"
echo -e "${CYAN}Visit: https://blackroad-collab-dashboard.pages.dev${NC}"
echo ""
