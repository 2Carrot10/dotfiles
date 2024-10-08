import subprocess
import re
import os
import json

yesRegEx = re.compile("y(es)?", re.IGNORECASE)
noRegEx = re.compile("n(o)?", re.IGNORECASE)

def confirmResponse(question):
    response = input(question)
    print("\n")
    if yesRegEx.match(response):
        return True
    if not noRegEx.match(response):
        print(f"Error! could not understand {response}")
        return confirmResponse(question)


def excecuteCommand(command):
    print(f"Excecuting '{command}'...")
    subprocess.run(command, shell = True)

def confirmCommand(command):
    if confirmResponse(f"Would you like to excecute this command: '{command}' (Y/N): "):
        excecuteCommand(command)
    else:
        print("Command will not be excecuted.")

def linkFiles(name):
    locationConfPath = os.path.join(name, configFileName)
    if not os.path.isfile(locationConfPath):
        print(f"Configuration could not be found for {name}")
        return
    print(f"\n{bcolors.BOLD}{"━" * 50}{bcolors.ENDC}\n")
    print(f"{bcolors.BOLD}Located the following dotfiles: {bcolors.OKBLUE}{name}{bcolors.ENDC}")
    if not confirmResponse("Would you like to add these dotfiles? (Y/N): "):
       return 

    with open(locationConfPath) as locationFile:
        print(f"""Current dotfile settings from {bcolors.OKBLUE}{configFileName}{bcolors.ENDC}: """)
        print(locationFile.read())
        if not confirmResponse("Would you like to go through with the linking prosses using these settings? (Y/N): "):
            return 
        locationFile.seek(0)
        data = json.load(locationFile)
        target_files = os.path.join(os.getcwd(), name, data["target_files"])
        desired_endpoint = os.path.expanduser(data["desired_endpoint"])
        endpoint_with_name = os.path.join(desired_endpoint, os.path.basename(os.path.normpath(target_files)))
        if os.path.islink(endpoint_with_name):
            print(f"""{bcolors.OKBLUE}{endpoint_with_name}{bcolors.ENDC} is a link.
It must be removed before the new dotfiles can be added.""")
            if confirmResponse("Remove link? (Y/N): "):
                confirmCommand(f"rm {endpoint_with_name}")

        elif os.path.isdir(endpoint_with_name):
            print(f"""{bcolors.OKBLUE}{endpoint_with_name}{bcolors.ENDC} already exists!
It must be removed before the new dotfiles can be added.""")
            if confirmResponse("Remove files? (Y/N): "):
                confirmCommand(f"rm -r {endpoint_with_name}")

        if os.path.isdir(endpoint_with_name) or os.path.exists(endpoint_with_name):
            print(f"Because {bcolors.OKBLUE}{endpoint_with_name}{bcolors.ENDC} already exists, no further opperations can be done on this file")
            return 
        if confirmCommand(f"ln -s {target_files} {desired_endpoint}"):
            print(f"Sucsessfuly added dotfiles from {bcolors.OKBLUE}{name}{bcolors.ENDC}!")

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

configFileName = ".location.json"

print("""      _       _    __ _ _                         _
     | |     | |  / _(_) |                       | |
   __| | ___ | |_| |_ _| | ___  ___      ___  ___| |_ _   _ _ __
  / _` |/ _ \\| __|  _| | |/ _ \\/ __|    / __|/ _ \\ __| | | | '_ \\
 | (_| | (_) | |_| | | | |  __/\\__ \\    \\__ \\  __/ |_| |_| | |_) |
  \\__,_|\\___/ \\__|_| |_|_|\\___||___/    |___/\\___|\\__|\\__,_| .__/
                                                           | |
                                                           |_|""")
print(f"""This is the setup program for my dotfiles. It will create dotfile
symlinks for each program. {bcolors.WARNING}WARNING: this program has the
ability to permenantly delete your files; be careful! {bcolors.ENDC}

This command can either be run You have the ability to confirm or veto every command
before it is executed. If you would like, you can pipe the `yes` command into this
command to automate the installation prosses!
""")
directory = os.path.join(os.getcwd(), "dots/")

print(f"Locating all directories within {bcolors.OKBLUE}{directory}{bcolors.ENDC} for dotfiles")

for name in os.listdir(directory):
    fullName = os.path.join(directory, name)
    if os.path.isdir(fullName):
        linkFiles(fullName)
print(f"{bcolors.UNDERLINE}Setup complete!{bcolors.ENDC} Thank you for installing these dotfiles.")
