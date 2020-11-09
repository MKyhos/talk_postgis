# Dockerfile for PostgreSQL & Postgis

docker run \
    --name=postgis \
    -d \
    --env-file=postgis-env.list \
    -p 5432:5432 \
    --network=pgnetwork \
    -v postgis_data:/var/lib/postgresql \
    --restart=always \
    kartoza/postgis
    