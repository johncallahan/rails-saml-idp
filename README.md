This rails app doesn't *use* a postgres database, but currently requires one (to be fixed)

~~~~
% openssl req -x509 -sha256 -nodes -days 3650 -newkey rsa:2048 -keyout myKey.key -out myCert.crt
% openssl x509 -noout -fingerprint -sha1 -inform pem -in myCert.crt
~~~~

(1) strip HEADERS off myCert.crt
(2) run:
~~~~
export X509_CERT=$(cat myCert.crt)
export SECRET_KEY=$(cat myKey.key)
export USER_EMAIL=me@example.com
export PASSWORD=mypassword
~~~~
(3) use fingerprint output in SP client(s)

