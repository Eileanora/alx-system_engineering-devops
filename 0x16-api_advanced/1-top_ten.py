#!/usr/bin/python3
'''Scripts that returns top 10 hot posts for a given subreddit'''
import requests


def top_ten(subreddit):
    '''Function that returns the top 10 hot posts'''
    url = 'https://www.reddit.com/r/{}/hot.json?limit=10'.format(subreddit)
    headers = {'User-Agent': 'custom'}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        for post in response.json().get('data').get('children'):
            print(post.get('data').get('title'))
    else:
        print('None')
