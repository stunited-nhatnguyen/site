*How to install the application
```
   make up

   make exec
   
   python3 -m venv dmojsite
   . dmojsite/bin/activate
   cd site

   pip3 install wheel pymysql websocket-client Redis  && pip3 install mysqlclient && pip3 install -r requirements.txt &&\
      ./make_style.sh && python3 manage.py collectstatic && python3 manage.py compilejsi18n \
      && python3 manage.py compilemessages && npm install qu ws simplesets && pip3 install uwsgi\
      && pip3 install uwsgi

   python3 manage.py migrate
   python3 manage.py loaddata navbar
   python3 manage.py loaddata language_small
   python3 manage.py loaddata demo

   service redis-server start
   service supervisor stop
   service supervisor start 
   supervisorctl update
   service nginx restart
```
$Setting judge
```
   make exec
   cd judge
   su dmoj
   dmoj -c judge.yml localhost 
```
```
page: http://localhost
```

*Account:
   - username: admin
   - password: admin

*Create a new account supervisor
```
   make exec
   . dmojsite/bin/activate
   cd site
   python3 manage.py createsuperuser
```
