#!/bin/bash

# SSH Tunnel Script for Development Servers
# Forwards ports 3000, 7474, 7687, and 8001 from remote.dev to localhost

# Configuration
REMOTE_HOST="remote.dev"
REMOTE_USER="${USER}"  # Uses your current username, modify if different

# Port mappings (local:remote)
PORTS=(
    "3000:3000"
    "7474:7474"
    "7687:7687"
    "8001:8001"
)

echo "Starting SSH tunnels to ${REMOTE_USER}@${REMOTE_HOST}..."
echo "Forwarding ports: 3000, 7474, 8001"
echo ""
echo "Access your services at:"
echo "  - http://localhost:3000"
echo "  - http://localhost:7474"
echo "  - http://localhost:7687"
echo "  - http://localhost:8001"
echo ""
echo "Press Ctrl+C to close all tunnels"
echo ""

# Build SSH command as an array for safe argument handling
# -N: Don't execute remote command (just forwarding)
# -o ExitOnForwardFailure=yes: Fail immediately if a port is already in use
# -o ServerAliveInterval=60: Send keepalives to detect dead connections
SSH_ARGS=(-N -o ExitOnForwardFailure=yes -o ServerAliveInterval=60)
for port_map in "${PORTS[@]}"; do
    local_port="${port_map%%:*}"
    remote_port="${port_map#*:}"
    SSH_ARGS+=(-L "${local_port}:localhost:${remote_port}")
done

exec ssh "${SSH_ARGS[@]}" "${REMOTE_USER}@${REMOTE_HOST}"
