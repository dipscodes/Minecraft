import requests

droplet_id = 123456789
DIGITALOCEAN_TOKEN = "your token goes here"

get_url = "https://api.digitalocean.com/v2/droplets?page=1"
post_url = f"https://api.digitalocean.com/v2/droplets/{droplet_id}/actions"

headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {DIGITALOCEAN_TOKEN}"
}

data = {"type":"power_on"}

list_of_droplets = requests.get(url=get_url, headers=headers).json()["droplets"]

for droplet in list_of_droplets:
    if droplet["id"] == droplet_id:
        if droplet["status"] == "off":
            requests.post(url=post_url, json=data, headers=headers).json()
