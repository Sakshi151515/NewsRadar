from django.urls import path
from . import views

urlpatterns = [
    # Home
    path('', views.home, name='home'),

    # User Authentication
    path('register/', views.register, name='register'),
    path('login/', views.user_login, name='login'),
    path('logout/', views.user_logout, name='logout'),
    path('profile/', views.profile, name='profile'),

    # Bookmark
    path('bookmark/<int:article_id>/', views.bookmark_article, name='bookmark'),
    path('bookmarks/', views.bookmarks, name='bookmarks'),
]