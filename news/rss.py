import feedparser
import requests

RSS_URL = "https://feeds.bbci.co.uk/news/rss.xml"


def get_latest_news():
    try:
        headers = {
            "User-Agent": "Mozilla/5.0"
        }

        response = requests.get(
            RSS_URL,
            headers=headers,
            timeout=15
        )

        response.raise_for_status()

        feed = feedparser.parse(
            response.content
        )

        if not feed.entries:
            print(
                "RSS ERROR: No news entries received"
            )
            return []

        articles = []

        for item in feed.entries[:10]:
            articles.append({
                "title": item.get(
                    "title",
                    "No title available"
                ),
                "link": item.get(
                    "link",
                    "#"
                ),
                "description": item.get(
                    "summary",
                    "No description available."
                ),
            })

        print(
            f"RSS SUCCESS: "
            f"{len(articles)} news articles loaded"
        )

        return articles

    except Exception as e:
        print(
            f"RSS ERROR: {str(e)}"
        )
        return []