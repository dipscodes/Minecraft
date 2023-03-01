import requests

droplet_id = 342253375
DIGITALOCEAN_TOKEN = "Bearer dop_v1_da76d577ee9beb54a906cdc8ab93ff91d8fdb2b7b571848eda221248085cac6c"

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
            requests.post(url=post_url, json=data, headers=headers)
