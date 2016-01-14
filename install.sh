#!/bin/bash
pip install virtualenv
virtualenv venv # create virtual environment
source venv/bin/activate # activate virtual environment
pip install flask
pip install flask-login
pip install flask-mail
pip install flask-sqlalchemy
pip install sqlalchemy-migrate
pip install flask-whooshalchemy
pip install flask-wtf
pip install flask-bcrypt