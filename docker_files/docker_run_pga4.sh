docker run --publish 5050:5050 \
    --volume=pga4vol:/var/lib/pgadmin \
    --env-file=pgadmin-env.list \
    --name=pgadmin4 \
    --hostname=pgadmin4 \
    --network=pgnetwork \
    -d dpage/pgadmin4
