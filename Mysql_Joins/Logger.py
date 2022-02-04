"""
@Author: Farzana Shaikh
@Date: 30-01-2022 04:00PM
@Last Modified by: Farzana Shaikh
@Last Modified time: 31-01-2022 04:00PM
@Title : Logger file for handling logs for other files.
"""
import logging
import sys


logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

formatter = logging.Formatter('%(asctime)s:%(name)s:%(message)s')

file_handler = logging.FileHandler("mysql.log","a")
stream_handler = logging.StreamHandler(sys.stdout)

file_handler.setLevel(logging.DEBUG)
file_handler.setLevel(logging.INFO)
file_handler.setLevel(logging.WARNING)
file_handler.setLevel(logging.ERROR)

file_handler.setFormatter(formatter)

stream_handler = logging.StreamHandler()
stream_handler.setFormatter(formatter)

logger.addHandler(file_handler)
logger.addHandler(stream_handler)

