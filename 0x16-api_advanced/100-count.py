import requests


def count_words(subreddit, word_list, after='', word_count={}):
    '''Function that parses the title of hot articals'''
    url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
    headers = {'User-Agent': 'custom'}
    params = {'after': after}
    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)
    if response.status_code != 200:
        return None

    posts = response.json().get('data').get('children')
    for post in posts:
        title = post.get('data').get('title')
        words = title.split(' ')
        for word in words:
            word = word.lower()
            if word in word_list:
                if word in word_count:
                    word_count[word] += 1
                else:
                    word_count[word] = 1
    after = response.json().get('data').get('after')
    if after is None:
        if len(word_count) == 0:
            return None
        else:
            for key, value in sorted(word_count.items(),
                                     key=lambda item: (item[1], item[0]),
                                     reverse=True):
                print('{}: {}'.format(key, value))
    else:
        return count_words(subreddit, word_list, after, word_count)
