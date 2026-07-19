from django.contrib import admin
from .models import Category, Article, Bookmark


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')


@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'title',
        'category',
        'author',
        'credibility_score',
        'is_fake',
        'published_date'
    )

    list_filter = (
        'category',
        'is_fake',
    )

    search_fields = (
        'title',
        'author',
    )


@admin.register(Bookmark)
class BookmarkAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'user',
        'article',
        'bookmarked_at'
    )