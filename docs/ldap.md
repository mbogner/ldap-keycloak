## Configuration

### LDAP

First a proper LDAP entry needs to be created as shown here

![ldap.png](img/ldap.png)

With this in place you can configure your keycloak instance.

### Keycloak

First create a new realm. The name doesn't matter.

![realm.png](img/realm.png)

Then configure a new entry under User Federation:

![add_federation.png](img/add_federation.png)

Then configure the new entry as shown below:

![ldap_federation_settings_1.png](img/ldap_federation_settings_1.png)

![ldap_federation_settings_2.png](img/ldap_federation_settings_2.png)

![ldap_federation_settings_3.png](img/ldap_federation_settings_3.png)

![ldap_federation_settings_4.png](img/ldap_federation_settings_4.png)

![ldap_federation_settings_5.png](img/ldap_federation_settings_5.png)

With this in place you can already login with the ldap user.