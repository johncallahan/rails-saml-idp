This rails app doesn't *use* a postgres database, but currently requires one (to be fixed)

The ruby-saml-idp gem has a default cert, so in order to create a
secure and unique X509 cert, run the following commands:
~~~~
% openssl req -x509 -sha256 -nodes -days 3650 -newkey rsa:2048 -keyout myKey.key -out myCert.crt
% openssl x509 -noout -fingerprint -sha1 -inform pem -in myCert.crt
~~~~
then:
1. strip HEADERS off myCert.crt
2. run:
~~~~
export X509_CERT=$(cat myCert.crt)
export SECRET_KEY=$(cat myKey.key)
export USER_EMAIL=me@example.com
export PASSWORD=mypassword
~~~~
3. use fingerprint output in SP client(s)
4. run:
~~~~
rails s -p 3001
~~~~
5. Test with a SAML service provider client like [rails_saml_sp](https://github.com/johncallahan/rails-saml-sp)
* remember to use the fingerprint
* set the IDP provider paths to http://localhost:3001/saml/auth
