FROM kliew/phoenix-queryserver

ADD offshore_leaks_csvs-20160524.tar.gz /tmp

# remove first line
RUN sed -i 1d /tmp/offshore_leaks_csvs-20160524/Entities.csv
# format dates
RUN export CSV=/tmp/offshore_leaks_csvs-20160524/Entities.csv && \
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
  $PHOENIX_HOME/bin/psql.py localhost:2181 /tmp/offshore_leaks_csvs-20160524/Entities.sql && \
  $PHOENIX_HOME/bin/psql.py localhost:2181 /tmp/offshore_leaks_csvs-20160524/Entities.csv
