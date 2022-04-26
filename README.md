*How to install the application
```
   make up

   make exec

   . dmojsite/bin/activate
   cd site

   pip3 install wheel pymysql websocket-client Redis  && pip3 install mysqlclient && pip3 install -r requirements.txt &&\
      ./make_style.sh && python3 manage.py collectstatic && python3 manage.py compilejsi18n \
      && python3 manage.py compilemessages && npm install qu ws simplesets && pip3 install uwsgi\
      && pip3 install uwsgi
   
   npm install qu ws simplesets
   pip3 install websocket-client

   service redis-server start
   service supervisor stop
   service supervisor start 
   supervisorctl update
   service nginx restart
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
