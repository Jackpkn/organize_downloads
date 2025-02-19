# Organize Downloads Script

## Overview
This script automatically organizes files in the `~/Downloads` directory into categorized folders based on their file types. It uses `inotify-tools` to monitor file changes and moves files accordingly.

## Features
- Monitors `~/Downloads` for new files.
- Automatically moves files into categorized directories:
  - Images → `~/Pictures`
  - Documents → `~/Documents`
  - Music → `~/Music`
  - Videos → `~/Videos`
  - Archives → `~/Archives`
  - Other files → `~/Other`
- Ignores incomplete downloads (`.crdownload`, `.com.google.Chrome.*`).
- Can run as a background systemd service.

## Prerequisites
Ensure `inotify-tools` is installed:
```bash
sudo apt update && sudo apt install inotify-tools -y
```

## Installation
1. Clone the repository:
```bash
git clone https://github.com/yourusername/organize-downloads.git
cd organize-downloads
```

2. Make the script executable:
```bash
chmod +x organize_downloads.sh
```

3. Run the script manually:
```bash
./organize_downloads.sh
```

## Running as a Systemd Service (Optional)
To run the script automatically in the background:

1. Copy the service file:
```bash
sudo cp organize-downloads.service /etc/systemd/system/
```

2. Reload systemd:
```bash
sudo systemctl daemon-reload
```

3. Enable and start the service:
```bash
sudo systemctl enable organize-downloads.service
sudo systemctl start organize-downloads.service
```

4. Check service status:
```bash
sudo systemctl status organize-downloads.service
```

## Logs
All file movements are logged in:
```bash
cat ~/organize_downloads.log
```

## Contributing
Feel free to fork this repository, submit issues, or create pull requests.

## License
This project is licensed under the MIT License.

