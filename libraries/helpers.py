import csv
from pathlib import Path

def read_data(file_path):
    rows = []
    with open(file_path, newline="", encoding="utf-8") as file:
        reader = csv.DictReader(file)
        for row in reader:
            rows.append(row)
    return rows

def generate_email(username):
    return f"{username}@test.local"

def valid_postal_code(code):
    code = str(code).strip()
    return code.isdigit() and 4 <= len(code) <= 10