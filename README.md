# JSFScan.sh
Blog can be found at https://medium.com/@patelkathan22/beginners-guide-on-how-you-can-use-javascript-in-bugbounty-492f6eb1f9ea?sk=21500dc4288281c7e6ed2315943269e7

Script made for all your javascript recon automation in bugbounty.Just pass subdomain list to it and options according to your preference.

# Installation
**Note: Make sure you have installed golang properly before running installation script.**
```
$ sudo chmod +x install.sh
$ ./install.sh
```

# Usage
Target List should be with `https://` and `http://` use httpx or httprobe for this.
```
https://hackerone.com
https://github.com
```
And if you want to add cookie then edit the command at line 23 `cat $target | hakrawler -js -cookie "cookie here" -depth 2 -scope subs -plain >> jsfile_links.txt` 

```
 _______ ______ _______ ______                          _     
(_______/ _____(_______/ _____)                        | |    
     _ ( (____  _____ ( (____   ____ _____ ____     ___| |__  
 _  | | \____ \|  ___) \____ \ / ___(____ |  _ \   /___|  _ \ 
| |_| | _____) | |     _____) ( (___/ ___ | | | |_|___ | | | |
 \___/ (______/|_|    (______/ \____\_____|_| |_(_(___/|_| |_|
                                                              
Usage: 
       -l   Gather Js Files Links
       -e   Gather Endpoints For JSFiles
       -s   Find Secrets For JSFiles
       -m   Use Meg for fetching JsFiles for manual testing
       -w   Make a wordlist using words from jsfiles
       -o   Make an Output Directory to put all things Together

```
[![asciicast](https://asciinema.org/a/z2DrdjRgVMhr4wF0BhigaF6uN.svg)](https://asciinema.org/a/z2DrdjRgVMhr4wF0BhigaF6uN)

## Thank You For Trying!
**Your Contribution and Suggestions are welcomed.**
