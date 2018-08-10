# Nginx + LDAP Authentication
Docker with Nginx and LDAP authentication based on the module [kvspb/nginx-auth-ldap](https://github.com/kvspb/nginx-auth-ldap)

Change in the nginx.conf the variables:
- <AD_SERVER>
- <AD_REALM>
- <USERNAME_FOR_LDAP_USER>
- <USERNAME_FOR_LDAP_PASSWORD>

You need an user for authenticate via LDAP to authenticate real users.