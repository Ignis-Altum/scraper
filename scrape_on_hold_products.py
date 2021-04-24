import requests
from bs4 import BeautifulSoup
import pandas as pd
import threading
#from domains import get_website_function, get_website_name
from scraper.constants import REQUEST_HEADER, REQUEST_COOKIES
from scraper.domains import get_website_function, get_website_name


# REQUEST_HEADER = {
#     "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36"
# }
# REQUEST_COOKIES = {"cookies_are": "working"}


class ScrapeTester:
    def __init__(self, category: str, url: str) -> None:
        self.category = category
        self.url = url
        self.website_name = get_website_name(url)
    
    def scrape_info(self) -> None:
        soup = ScrapeTester.request_url(self.url)
        self.get_info(soup)

    @staticmethod
    def request_url(url: str) -> BeautifulSoup:
        response = requests.get(
            url, headers=REQUEST_HEADER, cookies=REQUEST_COOKIES
        )
        return BeautifulSoup(response.text, "html.parser")

    def get_info(self, soup: BeautifulSoup):
        try:
            website_function = get_website_function(self.website_name)
            website_function(soup)
        except Exception:
            # print(f"Not available: {self.url}")
            return
        print(f"{self.category},{self.url}")


def main():
    products_df = pd.read_csv(
        f"./scraper/products_on_hold.csv", sep=",", header=0
    )

    products = [ScrapeTester(category, url) for category, url in zip(products_df["category"], products_df["url"])]

    threads = [threading.Thread(target=product.scrape_info) for product in products]

    for thread in threads:
        thread.start()

    for thread in threads:
        thread.join()


if __name__ == "__main__":
    main()
