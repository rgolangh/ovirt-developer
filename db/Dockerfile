#
# This container is a data volume one. Its purpose is to initiate an empty
# ovirt-engine database. Since schema is subject to changes in time and
# the entry point into the project maybe in differnt versions, it was
# decideds to keep this image schema-less and let the developer initiate
# the schema according to the branch which is at work.
#
# This instructions is starting a postgres deamon to create an empty db with user.
# The access config is being set in pg_hba.
#
FROM centos/postgresql

USER root

USER postgres

COPY pg_hba.conf /var/lib/pgsql/data/

RUN postgres -i -D /var/lib/pgsql/data >/tmp/log 2>&1 </dev/null &  \
  sleep 5 \
  && createuser -e -w engine \
  && createdb -O engine -T template0 engine -E UTF8 --lc-collate=en_US.UTF-8  --lc-ctype=en_US.UTF-8 engine

CMD /bin/true


