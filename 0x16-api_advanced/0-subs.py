#!/usr/bin/python3
'''Script that returns the total number of subs for a subreddit'''
import requests


def number_of_subscribers(subreddit):
    '''Functions that returns the number of subscribers'''
    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    headers = {'User-Agent': 'custom'}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        return response.json().get('data').get('subscribers')
    else:
        return 0
