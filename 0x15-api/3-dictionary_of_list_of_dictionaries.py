#!/usr/bin/python3
'''script that exports all employees TODO list progress to a JSON file'''
import json
import requests

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    # Get all users
    users = requests.get(url + "users").json()

    all_tasks = {}
    for user in users:
        user_id = user['id']
        # Get the todo list using the user id
        todo = requests.get(url + "todos", params={"userId": user_id}).json()

        tasks = []
        for task in todo:
            tasks.append({
                "username": user['username'],
                "task": task.get("title"),
                "completed": task.get("completed")
            })
        all_tasks[user_id] = tasks

    with open('todo_all_employees.json', 'w') as jsonfile:
        json.dump(all_tasks, jsonfile)
