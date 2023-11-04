import requests


def send_post(url, api_key, data):
    try:
        res = requests.post(url, json=data, headers={'X-Api-Key': api_key}, timeout=10)
        return res.json(), res.status_code
    except:
        return None, 400


def send_get(url, api_key, data):
    try:
        res = requests.get(url, params=data, headers={'X-Api-Key': api_key}, timeout=10)
        return res.json(), res.status_code
    except:
        return None, 400
