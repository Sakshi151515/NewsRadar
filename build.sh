#!/usr/bin/env bash

pip install -r requirements.txt

python manage.py collectstatic --noinput

python manage.py migrate

python manage.py shell -c "
from django.contrib.auth import get_user_model
User = get_user_model()

username = 'admin'
email = 'admin@gmail.com'
password = 'Admin@123'

if not User.objects.filter(username=username).exists():
    User.objects.create_superuser(
        username=username,
        email=email,
        password=password
    )
    print('Admin user created successfully')
else:
    print('Admin user already exists')
"