openssl req -x509 -nodes -days 665 -newkey rsa:2048 -keyout privkey.pem -out cert.pem -config ssl.conf -sha256

cat cert.pem privkey.pem > fullchain.pem
