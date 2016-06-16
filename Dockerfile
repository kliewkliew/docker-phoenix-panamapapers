FROM kliew/phoenix-queryserver

ADD offshore_leaks_csvs-20160524.tar.gz /tmp
COPY DDL /tmp/DDL

ENV IMPORT_DATA=/tmp/offshore_leaks_csvs-20160524
ENV IMPORT_DDL=/tmp/DDL

# remove first line
RUN sed -i 1d $IMPORT_DATA/*.csv
# format dates
RUN export CSV=$IMPORT_DATA/Entities.csv && \
  perl -i -pe 's/(\d{2})-(\w{3})-(\d{4})/$3-$2-$1 00:00:00/g' $CSV && \
  perl -i -pe 's/JAN/01/g' $CSV && \
  perl -i -pe 's/FEB/02/g' $CSV && \
  perl -i -pe 's/MAR/03/g' $CSV && \
  perl -i -pe 's/APR/04/g' $CSV && \
  perl -i -pe 's/MAY/05/g' $CSV && \
  perl -i -pe 's/JUN/06/g' $CSV && \
  perl -i -pe 's/JUL/07/g' $CSV && \
  perl -i -pe 's/AUG/08/g' $CSV && \
  perl -i -pe 's/SEP/09/g' $CSV && \
  perl -i -pe 's/OCT/10/g' $CSV && \
  perl -i -pe 's/NOV/11/g' $CSV && \
  perl -i -pe 's/DEC/12/g' $CSV

ENV TZ GMT-0

RUN /etc/bootstrap-phoenix.sh && \
  $PHOENIX_HOME/bin/psql.py localhost:2181 $IMPORT_DDL/all_edges.sql && \
  $PHOENIX_HOME/bin/psql.py localhost:2181 $IMPORT_DATA/all_edges.csv && \
  $PHOENIX_HOME/bin/psql.py localhost:2181 $IMPORT_DDL/Addresses.sql && \
  $PHOENIX_HOME/bin/psql.py localhost:2181 $IMPORT_DATA/Addresses.csv && \
  $PHOENIX_HOME/bin/psql.py localhost:2181 $IMPORT_DDL/Entities.sql && \
  $PHOENIX_HOME/bin/psql.py localhost:2181 $IMPORT_DATA/Entities.csv && \
  $PHOENIX_HOME/bin/psql.py localhost:2181 $IMPORT_DDL/Intermediaries.sql && \
  $PHOENIX_HOME/bin/psql.py localhost:2181 $IMPORT_DATA/Intermediaries.csv && \
  $PHOENIX_HOME/bin/psql.py localhost:2181 $IMPORT_DDL/Officers.sql && \
  $PHOENIX_HOME/bin/psql.py localhost:2181 $IMPORT_DATA/Officers.csv
