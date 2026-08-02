from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login, logout
from django.contrib.auth.forms import AuthenticationForm

from .models import Article, Category, Bookmark
from .forms import RegisterForm
from .rss import get_latest_news


# ==========================
# Home Page
# ==========================
def home(request):
    query = request.GET.get('q')
    category = request.GET.get('category')

    articles = Article.objects.all()

    # Search
    if query:
        articles = articles.filter(
            title__icontains=query
        )

    # Category Filter
    if category:
        articles = articles.filter(
            category_id=category
        )

    categories = Category.objects.all()

    # BBC Live RSS News
    try:
        live_news = get_latest_news()
    except Exception as e:
        print("LIVE NEWS ERROR:", e)
        live_news = []

    context = {
        'articles': articles,
        'categories': categories,
        'query': query,
        'selected_category': category,
        'live_news': live_news,
    }

    return render(
        request,
        'news/home.html',
        context
    )


# ==========================
# Bookmark Article
# ==========================
@login_required
def bookmark_article(request, article_id):
    article = get_object_or_404(
        Article,
        id=article_id
    )

    Bookmark.objects.get_or_create(
        user=request.user,
        article=article
    )

    return redirect('home')


# ==========================
# My Bookmarks
# ==========================
@login_required
def bookmarks(request):
    user_bookmarks = Bookmark.objects.filter(
        user=request.user
    )

    return render(
        request,
        'news/bookmarks.html',
        {
            'bookmarks': user_bookmarks
        }
    )


# ==========================
# User Registration
# ==========================
def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)

        if form.is_valid():
            user = form.save()
            login(request, user)

            return redirect('home')

    else:
        form = RegisterForm()

    return render(
        request,
        'news/register.html',
        {
            'form': form
        }
    )


# ==========================
# User Login
# ==========================
def user_login(request):
    if request.method == 'POST':
        form = AuthenticationForm(
            request,
            data=request.POST
        )

        if form.is_valid():
            user = form.get_user()
            login(request, user)

            return redirect('home')

    else:
        form = AuthenticationForm()

    return render(
        request,
        'news/login.html',
        {
            'form': form
        }
    )


# ==========================
# User Logout
# ==========================
@login_required
def user_logout(request):
    logout(request)

    return redirect('home')


# ==========================
# User Profile
# ==========================
@login_required
def profile(request):
    return render(
        request,
        'news/profile.html'
    )