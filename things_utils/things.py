#!/usr/bin/env python3

import os
import requests

# Built-in list IDs name start
ID_INBOX = "inbox"
ID_TODAY = "today"
ID_ANYTIME = "anytime"
ID_UPCOMING = "upcoming"
ID_SOMEDAY = "someday"
ID_LOGBOOK = "logbook"
ID_TOMORROW = "tomorrow"
ID_DEADLINES = "deadlines"
ID_REPEATING = "repeating"
ID_ALL_PROJECTS = "all-projects"
ID_LOGGED_PROJECTS = "logged-projects"
# Built-in list IDs name end


def param_to_str(param):
    return "&".join(["{}={}".format(key, value) for key, value in param.items() if value])


def execute_cmd(url, param):
    os.system("open '{}?{}'".format(url, param))


class Things:
    def __init__(self):
        pass

    @classmethod
    def show(cls, id=None, query=None, filter=None):
        """
        Args:
            - id: str:
                built-in list IDs:
                "inbox", "today", "anytime", "upcoming", "someday", "logbook", 
                "tomorrow", "deadlines", "repeating", "all-projects", "logged-projects".
                or the id of an area, project, tag or to-do
                eg "53C5D84F-5EAF-4BC2-9A59-5A949F98A406-20200702"
            - query: str:
                The name of an area, project, tag or a built-in list to show. 
                This is equivalent to entering the query text in to the quick 
                find within Things and selecting the first result
            - filter: str:
                Comma separated strings corresponding to the titles of tags that the list should be filtered by.
        """
        url = "things:///show"
        param = {"id": id, "query": query, "filter": filter}
        param = param_to_str(param)
        os.system("open '{}?{}'".format(url, param))


if __name__ == "__main__":
    import argparse
    def parser():
        ap = argparse.ArgumentParser()
        ap.add_argument("-i", "--id", help="add id")
        ap.add_argument("-q", "--query", help="add query")
        ap.add_argument("-f", "--filter", help="add filter")
        return vars(ap.parse_args())

    args = parser()
    Things.show(id=args["id"], query=args["query"], filter=args["filter"])
