import csv
from pathlib import Path


def is_valid_postal_code(code):
    code = str(code).strip()
    return code.isdigit() and 4 <= len(code) <= 10


def read_login_test_data(file_path):
    rows = []
    path = Path(file_path)
    with path.open(newline="", encoding="utf-8") as file:
        reader = csv.DictReader(file)
        for row in reader:
            rows.append(row)
    return rows


def normalize_value(value):
    if value is None:
        return ""
    value = str(value).strip()
    if value.upper() == "EMPTY":
        return ""
    return value