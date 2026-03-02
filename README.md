# Linux HTML App Launcher

This project provides a simple way to run an HTML-based program as a native Linux application using a **Bash script** and a **.desktop file**.  

It is intended for Linux systems only.


## How it works

1. Download your HTML-based app into a folder on your system.  
2. Place the `run.sh` script inside the same folder as your HTML app.  
3. Edit **line 3** of `run.sh` and replace the path with the path to your HTML app folder.  
4. Download the `APP_NAME.desktop` file.  
5. Rename it to match your application's name.  
6. Edit the following fields inside the `.desktop` file:
    - `Name` → The name of your application  
    - `Comment` → A short description of your app  
    - `Exec` → Path to your `run.sh` script  
    - `Icon` → Path to an icon file for your app (optional)  
    - `Categories` → Application categories (as indicated in the file)
    - 

## Usage

After configuring `run.sh` and the `.desktop` file:

1. Make the `run.sh` script executable:
    `chmod +x run.sh`
2. Launch your app by double-clicking the `.desktop` file in your file manager, or searching for it in your system applications menu.


## Notes

· This project does not include the HTML app itself; you must provide your own.

· The script and desktop file are intended as a template to turn any HTML app into a Linux “native” app.

· Tested on Linux systems using Firefox. Other browsers may require modifications.

· This is a lightweight, experimental tool mainly for learning and personal use.
