import shutil
import os
from datetime import datetime

def backup_master():
    source = "data/master_audit.csv"
    if not os.path.exists(source):
        print("[-] master_audit.csv not found.")
        return
    
    audit_dir = "audit"
    if not os.path.exists(audit_dir):
        os.makedirs(audit_dir)
    
    timestamp = datetime.now().strftime("%Y-%m-%d")
    destination = f"{audit_dir}/master_audit_{timestamp}.csv"
    
    shutil.copy2(source, destination)
    print(f"[+] Backup created: {destination}")

if __name__ == "__main__":
    backup_master()
