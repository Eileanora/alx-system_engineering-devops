#!/usr/bin/python3
'''script that exports to csv the employee TODO list progress'''
import requests
from sys import argv
import csv


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    user_id = argv[1]
    # Get the user name
    user = requests.get(url + "users/{}".format(user_id)).json()
    # Get the todo list using the user id
    todo = requests.get(url + "todos", params={"userId": user_id}).json()

    # write to the csv file
    with open('{}.csv'.format(user_id), 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
        for task in todo:
            writer.writerow([user_id, user.get('username'),
                            task.get('completed'), task.get('title')])
