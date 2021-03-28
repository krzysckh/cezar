# cezar
ceasar cipher written in lua

# how to use it?

it's pretty easy

## download things

  - linux
    - install lua interpreter
    ```sudo apt-get isntall lua5.3```
  - windows
    - download lua interpreter binary from http://luabinaries.sourceforge.net/

## clone the repo

```
git clone https://github.com/krzysckh/cezar
cd cezar
```

## usage

run the program from terminal. it has some command line arguments. if you want to use them, add them **before** the text.

command line arguments:

```-n int``` changes how much the word is shifted (max is 11). change int to an intiger

```-d```     is used to decrypt

```-h```     shows help

run the program with command ```lua cezar.lua args word```

e.g. ```lua cezar.lua -n 3 gaming```



## known bugs
- it may work bad with upper-case letters 
