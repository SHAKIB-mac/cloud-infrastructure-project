import socket
import psutil

def get_hostname():
    return socket.gethostname()

def get_cpu_usage():
    return psutil.cpu_percent(interval=1)

def get_memory_usage():
    return psutil.virtual_memory().percent

def get_disk_usage():
    return psutil.disk_usage('/').percent

def get_ip_address():
    return socket.gethostbyname(socket.gethostname())

def get_status(cpu,memory,disk):
    if cpu < 80 and memory < 80 and disk < 80:
        return  "HEALTHY"
    else:
        return "WARNING"

def main():
    cpu = get_cpu_usage()
    memory = get_memory_usage()
    disk = get_disk_usage()

    print("Hostname:", get_hostname())
    print("CPU Usage:", cpu, "%")
    print("Memory Usage:", memory, "%")
    print("Disk Usage:", disk, "%")
    print("IP Address:", get_ip_address())
    print("Status:", get_status(cpu, memory, disk))

if __name__ == "__main__":
    main()
