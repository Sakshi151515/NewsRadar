import feedparser

RSS_URL = "https://feeds.bbci.co.uk/news/rss.xml"

def get_latest_news():
    feed = feedparser.parse(RSS_URL)

    articles = []

    for item in feed.entries[:10]:
        articles.append({
            "title": item.title,
            "link": item.link,
            "description": item.summary,
        })

    return articles