FROM mongo

ENV MONGO_INITDB_ROOT_USERNAME admin
ENV MONGO_INITDB_ROOT_PASSWORD admin
ENV MONGO_INITDB_DATABASE book
VOLUME /data/db
ADD mongo-init.js /docker-entrypoint-initdb.d/
