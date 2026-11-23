import random


def generate_first_name():
    return random.choice(["John", "Emma", "Liam", "Olivia", "Noah", "Ava"])


def generate_last_name():
    return random.choice(["Smith", "Brown", "Wilson", "Taylor", "Lee"])


def generate_zip_code():
    return str(random.randint(10000, 99999))