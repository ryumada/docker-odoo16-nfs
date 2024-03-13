#!/usr/bin/env bash
set -eo pipefail

echo "mounting NFS v4 Share for datadir..."
mount -t nfs -o vers=4 -o resvport -o nolock 10.184.0.18:/share/odoo-container-data/odoo/datadir /opt/odoo/datadir

echo
echo "mounting NFS v4 Share for log..."
mount -t nfs -o vers=4 -o resvport -o nolock 10.184.0.18:/share/odoo-container-data/odoo/log /opt/odoo/log

echo
echo "mounting completed ✅"

echo
echo "Running Odoo..."
# su will set the workdir to /home/odoo
su - odoo "/opt/odoo/run-odoo.sh"

