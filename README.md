NewsRadar – Real-Time News Aggregator & Fake News Detection System

This repository contains the NewsRadar full-stack web application used for collecting real-time news, displaying news articles by category, searching news, bookmarking articles, and supporting fake-news detection.

Project Structure

NewsRadar/
│
├── NewsRadar1/              # Main Django project configuration
│   ├── settings.py          # Project settings
│   ├── urls.py              # Main URL configuration
│   ├── wsgi.py              # WSGI configuration for deployment
│   └── asgi.py              # ASGI configuration
│
├── news/                    # Main NewsRadar application
│   ├── migrations/          # Database migration files
│   ├── templates/           # HTML templates
│   │   └── news/
│   │       ├── home.html
│   │       ├── bookmarks.html
│   │       └── ...
│   ├── static/              # Application static files
│   ├── models.py            # Database models
│   ├── views.py             # Application views
│   ├── urls.py              # News app URLs
│   ├── admin.py             # Django admin configuration
│   ├── rss.py               # RSS news fetching logic
│   └── apps.py              # Application configuration
│
├── static/                  # Global CSS, JavaScript, and images
├── media/                   # Uploaded media files
├── manage.py                # Django management file
├── requirements.txt         # Python dependencies
├── build.sh                 # Render build and migration commands
└── README.md                # Project documentation

Features

- Real-time news collection using RSS feeds
- News search functionality
- News category filtering
- Latest news display
- News article details
- Bookmark news articles
- User registration and login
- Django admin dashboard
- Fake-news detection support
- Responsive user interface
- Database-based news management

Technologies Used

Backend

- Python
- Django
- Django REST Framework
- RSS Feed Parser
- Gunicorn

Frontend

- HTML
- CSS
- JavaScript
- Bootstrap

Database

- SQLite – Local development
- PostgreSQL – Production deployment on Render

Deployment

- Render
- Gunicorn
- WhiteNoise

Setup Instructions

1. Clone the Repository

git clone https://github.com/Sakshi151515/NewsRadar.git

Navigate to the project folder:

cd NewsRadar

2. Create a Virtual Environment

python -m venv venv

Activate the virtual environment:

Windows

venv\Scripts\activate

Linux/macOS

source venv/bin/activate

3. Install Dependencies

pip install -r requirements.txt

4. Configure the Database

For local development, configure SQLite or MySQL in:

NewsRadar1/settings.py

Run database migrations:

python manage.py makemigrations

python manage.py migrate

5. Create an Admin User

python manage.py createsuperuser

Enter the username, email address, and password.

6. Run the Application

python manage.py runserver

The NewsRadar application will be available at:

http://127.0.0.1:8000/

The Django admin panel will be available at:

http://127.0.0.1:8000/admin/

Building for Production

Collect static files:

python manage.py collectstatic --noinput

Apply all database migrations:

python manage.py migrate

Run the Django application using Gunicorn:

gunicorn NewsRadar1.wsgi:application

Deployment

NewsRadar is deployed using Render.

Build Command

pip install -r requirements.txt && python manage.py collectstatic --noinput && python manage.py migrate

Start Command

gunicorn NewsRadar1.wsgi:application

Make sure the following environment variables are configured:

SECRET_KEY=your-secret-key
DEBUG=False
DATABASE_URL=your-postgresql-database-url
ALLOWED_HOSTS=your-render-domain

Live Project

NewsRadar is available at:

https://newsradar-1-x2le.onrender.com

Contributing

1. Fork the repository.
2. Create a feature branch:

git checkout -b feature-name

3. Make your changes and commit them:

git add .

git commit -m "Add new feature"

4. Push the changes:

git push origin feature-name

5. Create a Pull Request.

Future Enhancements

- AI-based fake-news classification
- Machine-learning news prediction
- Personalized news recommendations
- News sentiment analysis
- Multilingual news support
- Email notifications
- Mobile application integration
- Advanced news analytics dashboard

License

This project is developed for educational and academic purposes. You can replace this section with your preferred open-source license.
