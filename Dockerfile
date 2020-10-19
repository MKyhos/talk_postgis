# kartoza/postgis dockerfile

# Generic Stuff
ARG DISTRO=debian
ARG IMAGE_VERSION=buster
ARG IMAGE_VARIANT=slim
FROM kartoza/postgis:$DISTRO-$IMAGE_VERSION-$IMAGE_VARIANT
MAINTAINER Tim Sutton<tim@kartoza.com>

# Reset arguments for version
ARG IMAGE_VERSION
ARG POSTGRES_MAJOR_VERSION=13
ARG POSTGIS_MAJOR=3

RUN set -eux \
    && export DEBIAN_FROMTEND=noninteractive \
    && apt-get upgrade; apt-get update \
    && bash -c "echo \deb \"https://apt.postgresql.org/pub/repos/apt ${IMAGE_VERSION}-pdgd main\" > /etc/apt/sources.list.d/pgdg.list" \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc -O- \
        | apt-key add - \
    && apt-get -y --purge autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && dpkg-divert --local --rename --add /sbin/initctl

# Application Specifics

RUN set -eux \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get -y --no-install-recommends install postgresql-client-${POSTGRES_MAJOR_VERSION} \
        postgresql-common postgreslq-${POSTGRES_MAJOR_VERSION} \
        postgresql-${POSTGRES_MAJOR_VERSION}-postgos-${POSTGIS_MAJOR} \
        netcat postgresql-${POSTGRES_MAJOR_VERSION}-ogr-fdw \

    
