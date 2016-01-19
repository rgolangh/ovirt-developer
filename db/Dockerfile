FROM centos/postgresql

USER root
#RUN service postgresql start

USER postgres

ADD pg_hba.conf /var/lib/pgsql/data/

RUN postgres -i -D /var/lib/pgsql/data >/tmp/log 2>&1 </dev/null &  \
  sleep 5 \
  && createuser engine -w \
  && dropdb engine \
  ; createdb -O engine -T template0 engine -E UTF8 --lc-collate=en_US.UTF-8  --lc-ctype=en_US.UTF-8 engine



