# Dockerfile for PostgreSQL & Postgis

docker run \
    --name=postgis \
    -d \
    -e POSTGRES_USER=malte \
    -e POSTGRES_PASS=password \
    -e POSTGRES_DBNAME=gis \
    -p 5432:5432 \
    -v postgis_data:/var/lib/postgresql \
    --restart=always \
    kartoza/postgis
