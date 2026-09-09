# naemon-ple
A lightweight PowerShell script for monitoring SQL Server Page Life Expectancy (PLE), designed for integration with Naemon/Nagios monitoring systems.

## Installation
Clone the repository and navigate to the script directory:
```bash
git clone https://github.com/hytcloud/naemon-ple.git
cd naemon-ple
```
Ensure the following prerequisites are met on the target Windows host:
- Windows PowerShell (recommended version: 5.1 or later)

## check_ple.ps1
**Usage**
```powershell
.\check_ple.ps1 -username <SQLUser> -password <SQLPassword>
```

**Options**
- -username   SQL Server login username
- -password   SQL Server login password

**Notes**
- Returns OK if PLE ≥ 1000 seconds
- Returns WARNING if 300 ≤ PLE < 1000 seconds
- Returns CRITICAL if PLE PLE < 300 seconds
- Exit codes follow Nagios plugin standards: 0=OK, 1=WARNING, 2=CRITICAL
- Version: 2026/09/09
- [GitHub Repo](https://github.com/hytcloud/naemon-ple.git)