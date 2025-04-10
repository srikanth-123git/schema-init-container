source /data/secrets
git clone https://github.com/srikanth-123git/${PROJECT_NAME}-${COMPONENT}
cd ${PROJECT_NAME}-$COMPONENT

if [ "${db_type}" == 'mongo' ]; then
  curl -L -O https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem
  mongo --tls --host $DB_HOST:27017 --tlsCAFile global-bundle.pem --username ${DB_USER} --password $DB_PASS <schema/${COMPONENT}.js
fi

if [ "${db_type}" == 'mysql' ]; then
  echo 'show databases;' | mysql -h${DB_HOST} -u${RDS_USER} -p${RDS_PASS} | grep cities
  if [ $? -eq 0 ]; then exit ; fi
  mysql -h${DB_HOST} -u${RDS_USER} -p${RDS_PASS} <schema/${COMPONENT}.sql
fi