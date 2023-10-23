#!/usr/bin/python3
'''script that displays on stdout the employee TODO list progress'''
import requests
from sys import argv


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    user_id = argv[1]
    # Get the user name
    user = requests.get(url + "users/{}".format(user_id)).json()
    # Get the todo list using the user id
    todo = requests.get(url + "todos", params={"userId": user_id}).json()

    completed_tasks = []
    for task in todo:
        if task.get("completed") is True:
            completed_tasks.append(task.get("title"))
    print("Employee {} is done with tasks({}/{}):"
          .format(user.get("name"), len(completed_tasks), len(todo)))
    for task in completed_tasks:
        print("\t {}".format(task))
