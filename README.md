# Development Environment Setup Script

A simple Bash script that automates the setup of a C++ and Python development environment on Ubuntu/Debian systems.

## Features

- Detects Ubuntu/Debian systems
- Installs essential development tools:
  - Git
  - GCC
  - G++
  - CMake
  - Valgrind
  - Python 3
  - pip
  - Vim
- Configures Git:
  - User name
  - Email
  - Default branch (`main`)
- Creates a standard project directory structure:
  ```
  ~/projects/
  ├── cpp
  └── python

  ~/notes
  ```
- Adds useful Bash aliases:
  - `gs` → `git status`
  - `ga` → `git add`
  - `gc` → `git commit`
  - `gp` → `git push`
  - `gl` → `git pull`
  - `ll` → `ls -la`
- Displays the installed software versions after setup.

## Requirements

- Ubuntu or Debian
- Bash
- `sudo` privileges
- Internet connection

## Usage

Clone the repository:

```bash
git clone https://github.com/YouanesAttia/dev-setup
cd dev-setup
```

Make the script executable:

```bash
chmod +x setup.sh
```

Run the script:

```bash
./setup.sh
```

After the installation finishes, reload your shell:

```bash
source ~/.bashrc
```

## Project Structure

```
.
├── setup.sh
└── README.md
```

## Notes

- The script is safe to run multiple times.
- Existing directories are preserved.
- Aliases are only added if they do not already exist.

## License

This project is intended for educational purposes.
