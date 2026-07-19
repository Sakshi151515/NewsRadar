from django.db import models
from django.contrib.auth.models import User


# Category Model
class Category(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def _str_(self):
        return self.name


# Article Model
class Article(models.Model):
    category = models.ForeignKey(
        Category,
        on_delete=models.CASCADE,
        related_name='articles'
    )

    title = models.CharField(max_length=300)
    description = models.TextField()
    url = models.URLField(unique=True)
    image = models.ImageField(upload_to='articles/', blank=True, null=True)

    author = models.CharField(max_length=200, blank=True)
    published_date = models.DateTimeField()

    credibility_score = models.FloatField(default=0.0)
    is_fake = models.BooleanField(default=False)

    created_at = models.DateTimeField(auto_now_add=True)

    def _str_(self):
        return self.title


# Bookmark Model
class Bookmark(models.Model):
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE
    )

    article = models.ForeignKey(
        Article,
        on_delete=models.CASCADE
    )

    bookmarked_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('user', 'article')

    def _str_(self):
        return f"{self.user.username} - {self.article.title}"

