dockerPostgis
=============

Scripts for building a <a href="http://www.docker.com/">Docker</a> image of the Postgres 9.3 and PostGIS 2.1.


<h3>Files:</h3>
<ul>
<li><code>README.md</code> - This file.</li>
<li><code>Dockerfile</code> - Docker file for building a Docker Image.</li>
<li><code>containerSetup.sh</code> - Commands for setting up Postgres & PostGIS inside a container.</li>
<li><code>setup.sh</code> - Host script for removing old containers and images from host machine. Then, it creates a Docker image called "postgis_img".</li>
</ul>

<h3>Prerequisites:</h3>
<ul>
<li><a href="http://www.docker.com/">Docker</a></li>
</ul>

<h3>Instructions:</h3>
<ol>
<li>Clone the project and go to the folder</li>
<li>Run the host script <code>./setup.sh</code>
<li>Log in the container <code>ssh -p 48901 root@localhost</code>. The default password is <em>xxxx.xxxx.xxxx</em></li>
<li>Go to <code>cd /</code></li>
<li>Run the container script <code>./containerSetup.sh</code></li>
<li><b>NOTE</b>: The database accepts conections using the port 48902</li>
</ol>