from flask import Flask
from monitor import (
    get_hostname,
    get_cpu_usage,
    get_memory_usage,
    get_disk_usage,
    get_ip_address,
    get_status
)

app = Flask(__name__)

@app.route("/")
def home():
    cpu = get_cpu_usage()
    memory = get_memory_usage()
    disk = get_disk_usage()

    return f"""


    Hostname: {get_hostname()}
    CPU Usage:{cpu}%
    Memory Usage: {memory}%
    Disk Usage: {disk}%
    IP Address: {get_ip_address()}
    Status: {get_status(cpu, memory, disk)}
    """
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
