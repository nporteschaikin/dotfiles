#!/bin/bash
set -e

source "$(dirname $0)/helpers.sh"

step "📦 Installing npm dependencies..."
run "npm install --global --quiet pure-prompt"
success "📦 Done!"
