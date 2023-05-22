# LDAP Keycloak

This small sample shows how to use OpenLDAP as user directory for keycloak.

It supports updating users in both directions. They need to be created in the directory manually or via an extra
API because the creation of the uid field can't be done automatically, but it is required to read the id from the
directory. I couldn't find a proper way to solve this in OpenLDAP.

The keycloak container needs a proper keystore mapped as configured in the compose file:

```yaml
services:
  keycloak:
    volumes:
     - ./docker/keycloak/keystore.jks:/opt/keycloak/conf/server.keystore:ro
```

As this file container private data this isn't included in this sample. But to make life easier there
is a script [genkeystore.sh](docker/keycloak/genkeystore.sh) that creates such a keystore from letsencrypt keys.

I recommend [JXplorer](http://jxplorer.org/) ldap browser.

See [ldap.md](docs/ldap.md) for further information on how to configure the containers after startup to make keycloak
use your OpenLDAP directory server.