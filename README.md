# OverTheWire-savepwd

## Why?

I had a hard time managing password for different level's of [WarGames](https://overthewire.org/wargames/). So, being the lazy sysadmin I am, I decided to write a small shell script that saves the password and helps me login.

## Installation

You know the drill, save `login.sh` where ever you want.

## Setup

It's best to have individual folder for each game. Inside the folder create `GAME` file which contains wargaame title and the ssh port separated by a colon (`:`). Ex. for bandit wargame `bandit:2220`.

## Usage

The script has two options, one for saving password another for ssh-ing into the game.

### Save password

```bash
$ ./login -s 0 bandit0 
LEVEL 0: Trying to login
```

### Login 

```bash
$ ./login -l 0
LEVEL 0: Saving password
```

### Save password and try to login 

```console
$ ./login --save-and-login 0 bandit0
```

July 2021, Muse Sisay