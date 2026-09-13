# Windows System File Checker

A simple Windows batch script that checks whether common Windows System32 programs exist.

## Features

- Checks common Windows system programs.
- Automatically finds the Windows installation using `%WINDIR%`.
- Shows `[OK]` and `[MISSING]` results.
- Counts found and missing files.
- Optionally runs Windows System File Checker with `sfc /verifyonly`.
- Does not delete, modify, or repair files.

## Requirements

- Windows 10 or Windows 11
- No Python required
- No external packages required

## Usage

1. Download `windows_system_file_checker.bat`.
2. Double-click it, or run it from Command Prompt:

```bat
windows_system_file_checker.bat
```

3. Press Enter when asked.
4. Review the file check results.
5. Choose `Y` if you want to run:

```bat
sfc /verifyonly
```

## Important

This program only checks whether the listed files exist.

A `[MISSING]` result does **not** automatically mean Windows is damaged. Windows versions can have different system files.

For a Windows integrity check, the script can run Microsoft's built-in:

```bat
sfc /verifyonly
```

This command verifies system files without attempting to repair them.

## Project Structure

```text
windows-system-file-checker/
├── windows_system_file_checker.bat
├── README.md
├── LICENSE
└── .gitignore
```

## License

MIT License. See `LICENSE`.
