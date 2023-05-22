#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${DIR}" || exit 1

KEYDIR=local
KS=keystore.jks
P12=pkcs.p12
PASSWORD=password
KEY_ALIAS=letsencrypt

echo "delete ${KS} and ${P12} if existent"
rm -f ${KS} ${P12}
echo "creating ${P12}"
openssl pkcs12 -export -inkey $KEYDIR/privkey.pem -in $KEYDIR/cert.pem -certfile $KEYDIR/chain.pem \
        -name ${KEY_ALIAS} -password pass:${PASSWORD} -out ${P12}
echo "creating ${KS}"
keytool -importkeystore -destkeystore ${KS} -deststorepass ${PASSWORD} -srckeystore ${P12} \
        -srcstoretype PKCS12 -srcstorepass ${PASSWORD} -alias ${KEY_ALIAS}
rm ./${P12}
echo "done"