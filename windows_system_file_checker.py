import os
from pathlib import Path

print("=" * 60)
print("        WINDOWS SYSTEM FILE CHECKER")
print("=" * 60)

input("\nPress E to check Windows system files...")

system32 = Path(os.environ.get("WINDIR", r"C:\Windows")) / "System32"

if not system32.exists():
    print("\nSystem32 folder was not found.")
    input("\nPress Enter to exit...")
    raise SystemExit

system_files = [
    "notepad.exe", "calc.exe", "cmd.exe", "mspaint.exe", "explorer.exe",
    "winver.exe", "control.exe", "services.exe", "regedit.exe", "taskmgr.exe",
    "msconfig.exe", "eventvwr.exe", "perfmon.exe", "dxdiag.exe", "charmap.exe",
    "magnify.exe", "osk.exe", "verifier.exe", "wscript.exe", "cscript.exe",
    "powershell.exe", "powershell_ise.exe", "shutdown.exe", "systeminfo.exe",
    "whoami.exe", "ipconfig.exe", "netstat.exe", "ping.exe", "tracert.exe",
    "nslookup.exe", "pathping.exe", "ftp.exe", "certutil.exe", "cipher.exe",
    "sfc.exe", "dism.exe", "tasklist.exe", "taskkill.exe", "driverquery.exe",
    "hostname.exe", "where.exe", "findstr.exe", "robocopy.exe", "xcopy.exe",
    "format.com", "diskpart.exe", "chkdsk.exe", "defrag.exe", "cleanmgr.exe",
    "mrt.exe"
]

found = 0
missing = 0

print(f"\nChecking: {system32}\n")

for filename in system_files:
    path = system32 / filename

    if path.exists():
        print(f"[OK]      {filename}")
        found += 1
    else:
        print(f"[MISSING] {filename}")
        missing += 1

print("\n" + "=" * 60)
print(f"FOUND:   {found}")
print(f"MISSING: {missing}")
print("=" * 60)

answer = input(
    "\nDo you want to list ALL files currently inside System32? (y/n): "
).strip().lower()

if answer == "y":
    print("\nScanning System32...")
    try:
        all_files = sorted(p for p in system32.iterdir() if p.is_file())
        print(f"\nFound {len(all_files)} files in System32.\n")

        for path in all_files:
            print(path.name)

    except PermissionError:
        print("\nSome System32 files cannot be read because of Windows permissions.")

print("\nNOTE:")
print("This program checks whether files exist.")
print("It does NOT prove that Windows files are unmodified or healthy.")
print("For a real Windows integrity check, run:")
print("    sfc /verifyonly")

input("\nPress Enter to exit...")




