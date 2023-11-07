#!/usr/bin/python3
'''Script that recursively returns a list of all hot posts of a subreddit'''
import requests


def recurse(subreddit, hot_list=[], after=None):
    '''Function that returns a list of all hot posts'''
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {'User-Agent': 'custom'}
    params = {'after': after}
    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)
    if response.status_code != 200:
        return None
    else:
        for post in response.json().get('data').get('children'):
            hot_list.append(post.get('data').get('title'))
        after = response.json().get('data').get('after')
        if after is None:
            return hot_list
        else:
            return recurse(subreddit, hot_list, after)
