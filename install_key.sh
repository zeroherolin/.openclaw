#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
MODELS_JSON="$ROOT_DIR/agents/main/agent/models.json"
OPENCLAW_JSON="$ROOT_DIR/openclaw.json"

API_KEY="__API_KEY__"
FEISHU_APP_ID="__FEISHU_APP_ID__"
FEISHU_APP_SECRET="__FEISHU_APP_SECRET__"

command -v jq >/dev/null 2>&1 || { echo "jq is required"; exit 1; }

jq --arg apiKey "$API_KEY" \
  '.providers["custom-cloud-infini-ai-com"].apiKey = $apiKey' \
  "$MODELS_JSON" > "$MODELS_JSON.tmp" && mv "$MODELS_JSON.tmp" "$MODELS_JSON"

jq --arg apiKey "$API_KEY" \
   --arg appId "$FEISHU_APP_ID" \
   --arg appSecret "$FEISHU_APP_SECRET" \
  '.models.providers["custom-cloud-infini-ai-com"].apiKey = $apiKey
   | .channels.feishu.appId = $appId
   | .channels.feishu.appSecret = $appSecret' \
  "$OPENCLAW_JSON" > "$OPENCLAW_JSON.tmp" && mv "$OPENCLAW_JSON.tmp" "$OPENCLAW_JSON"