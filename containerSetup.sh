#!/bin/bash
############################################################################
# CHANGE POSTGRES PASSWORD
############################################################################
echo "Changing postgres password..."
export LC_ALL="en_US.UTF-8"
/etc/init.d/postgresql start
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'xxxx.xxxx.xxxx';"
############################################################################
# INSTALL POSTGIS
############################################################################
echo "Creating a PostGIS database...."
export LC_ALL="en_US.UTF-8"
sudo -u postgres createdb postgisDB
sudo -u postgres psql -d postgisDB -c "CREATE EXTENSION postgis;" 
sudo -u postgres psql -d postgisDB -c "CREATE EXTENSION postgis_topology;" 
#sudo -u postgres psql -d postgisDB -f /usr/share/postgresql/9.3/contrib/postgis-2.1/legacy.sql
sudo -u postgres psql -d postgisDB -f /usr/share/postgresql/9.3/contrib/postgis-2.1/postgis.sql
sudo -u postgres psql -d postgisDB -f /usr/share/postgresql/9.3/contrib/postgis-2.1/spatial_ref_sys.sql

