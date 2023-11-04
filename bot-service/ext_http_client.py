import requests


def send_post(url, api_key, data):
    try:
        res = requests.post(url, json=data, headers={'X-Api-Key': api_key}, timeout=30)
        return res.json(), res.status_code
    except requests.exceptions.ReadTimeout:
        return "timeout", 400
    except:
        return None, 400


def send_get(url, api_key, data):
    try:
        res = requests.get(url, params=data, headers={'X-Api-Key': api_key}, timeout=30)
        if res.headers.get('content-type') == 'application/json':
            return res.json(), res.status_code
        else:
            return res, res.status_code
    except requests.exceptions.ReadTimeout:
        return "timeout", 400
    except Exception as e:
        return "no connection", 400
