import requests
import logging


droplet_id = 342253375
DIGITALOCEAN_TOKEN = "dop_v1_909222ed2262c05a0f80340e44d8f83927e62efcb34f546ae20c145aac117f2d"

get_url = "https://api.digitalocean.com/v2/droplets?page=1"
post_url = f"https://api.digitalocean.com/v2/droplets/{droplet_id}/actions"

headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {DIGITALOCEAN_TOKEN}"
}

data = {"type": "power_on"}

list_of_droplets = requests.get(url=get_url, headers=headers).json()

try:
    if list_of_droplets['id'] == "Unauthorized":
        logging.error("The Key doesn't work.")
except KeyError:
    list_of_droplets = list_of_droplets["droplets"]
    for droplet in list_of_droplets:
        if droplet["id"] == droplet_id:
            if droplet["status"] == "off":
                requests.post(url=post_url, json=data, headers=headers)
                logging.info("Power on successful.")
