import subprocess
import re
import os
import json


yesRegEx = re.compile("y(es)?", re.IGNORECASE)
noRegEx = re.compile("n(o)?", re.IGNORECASE)

automatic = False

def handleCommand(response):
    if automatic:
        excecuteCommand(response)
        return True
    else:
        confirmCommand(response)
        return False

def confirmResponse(question):
    response = input(question)
    if yesRegEx.match(response):
        return True
    if not noRegEx.match(response):
        print(f"Error! could not understand {response}")
        return confirmResponse(question)


def excecuteCommand(command):
    print(f"Excecuting '{command}'...")
    subprocess.run(command, shell = True)

def confirmCommand(command):
    if confirmResponse(f"Would you like to excecute this command: '{command}' (Y/N):"):
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
    if not automatic:
        if not confirmResponse("Would you like to add these dotfiles? (Y/N): "):
           return 

    with open(locationConfPath) as locationFile:
        print(f"""Current dotfile settings from {bcolors.OKBLUE}{configFileName}{bcolors.ENDC}:""")
        print(locationFile.read())
        if not automatic:
            goToNext = False
            while not goToNext:
                response = input("Would you like to go through with the linking prosses using these settings? (Y/N): ")
                if yesRegEx.match(response):
                    goToNext = True
                elif noRegEx.match(response):
                    continue
                else:
                    print(f"Error! Can not understand {response}.")
                    goToNext = False
        locationFile.seek(0)
        data = json.load(locationFile)
        target_files = os.path.join(os.getcwd(), name, data["target_files"])
        desired_endpoint = os.path.expanduser(data["desired_endpoint"])
        endpoint_with_name = os.path.join(desired_endpoint, name)
        if os.path.islink(endpoint_with_name):
            print(f"""{bcolors.OKBLUE}{endpoint_with_name}{bcolors.ENDC} is a link.
It must be removed before the new dotfiles can be added.""")
            if automatic or confirmResponse("Remove link? (Y/N): "):
                handleCommand(f"rm {endpoint_with_name}")

        elif os.path.isdir(endpoint_with_name):
            print(f"""{bcolors.OKBLUE}{endpoint_with_name}{bcolors.ENDC} already exists!
It must be removed before the new dotfiles can be added.""")
            if automatic or confirmResponse("Remove files? (Y/N): "):
                handleCommand(f"rm -r {endpoint_with_name}")

        if os.path.isdir(endpoint_with_name) or os.path.exists(endpoint_with_name):
            print(f"Because {bcolors.OKBLUE}{endpoint_with_name}{bcolors.ENDC} already exists, no further opperations can be done on this file")
            return 
        if handleCommand(f"ln -s {target_files} {desired_endpoint}"):
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

This command can either be run (A)utomatically or (M)anually (with oversight
from the user). It is reccomended to only use automatic mode if you fully
understand what this script does. {bcolors.WARNING}Automatic mode may delete preexisting dotfiles!!!{bcolors.ENDC} 
When using manual mode, you have the ability to confirm or veto every command
before it is executed.
""")
goToNext = False
manualRegEx = re.compile("m(anual)?", re.IGNORECASE)
automaticRegEx = re.compile("a(utomatic)?", re.IGNORECASE)
acceptDangerRegEx = re.compile("I accept the risk", re.IGNORECASE)
while not goToNext:
    response = input("Which would you prefer? ((A)utomatic/(M)anual): ")
    if automaticRegEx.match(response):
        print("""This mode is dangerous! 
The new dotfiles will permenantly replace the old ones.
If you would like to confirm each command before it is excecuted, use manual mode instead.
Please confirm that you know what you are doing!""")
        response = input("Type 'I accept the risk' to continue with automatic mode:'")
        if(not acceptDangerRegEx.match(response)):
            continue
        goToNext = True
        automatic = True
    elif manualRegEx.match(response):
        goToNext = True
        automatic = False
    else:
        print(f"Error! Can not understand {response}.")

directory = os.getcwd()

print(f"Locating all directories within {bcolors.OKBLUE}{directory}{bcolors.ENDC} for dotfiles")

for name in os.listdir(directory):
    if os.path.isdir(name):
        linkFiles(name)
print(f"{bcolors.UNDERLINE}Setup complete!{bcolors.ENDC} Thank you for installing these dotfiles.")
