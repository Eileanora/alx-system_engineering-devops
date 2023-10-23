#!/usr/bin/python3
'''script that exports the employee TODO list progress to a JSON file'''
import json
import requests
from sys import argv

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    user_id = argv[1]
    # Get the user name
    user = requests.get(url + "users/{}".format(user_id)).json()
    # Get the todo list using the user id
    todo = requests.get(url + "todos", params={"userId": user_id}).json()

    tasks = []
    for task in todo:
        tasks.append({
            "task": task.get("title"),
            "completed": task.get("completed"),
            "username": user.get("username")
        })

    with open('{}.json'.format(user_id), 'w') as jsonfile:
        json.dump({user_id: tasks}, jsonfile)
