# JSFScan.sh
Blog can be found at https://medium.com/@patelkathan22/beginners-guide-on-how-you-can-use-javascript-in-bugbounty-492f6eb1f9ea?sk=21500dc4288281c7e6ed2315943269e7

Script made for all your javascript recon automation in bugbounty. Just pass subdomain list to it and options according to your preference.

# Features
```
1 - Gather Jsfile Links from different sources.
2 - Import File Containing JSUrls
3 - Extract Endpoints from Jsfiles
4 - Find Secrets from Jsfiles
5 - Get Jsfiles store locally for manual analysis
6 - Make a Wordlist from Jsfiles
7 - Extract Variable names from jsfiles for possible XSS.
8 - Scan JsFiles For DomXSS.
9 - Generate Html Report.
```

# Installation

There are two ways of executing this script: Either locally on the host machine or within a Docker container 

### Installing all dependencies locally

**Note: Make sure you have installed golang properly before running installation script locally.**

```
$ sudo chmod +x install.sh
$ ./install.sh
```

### Building the docker container 

When using the docker version, everything will be installed automatically. You just have to execute the following commands: 

```
$ git clone https://github.com/KathanP19/JSFScan.sh
$ cd JSFScan.sh/
$ docker build . -t jsfscan
```

In order to start the pre-configured container run the following command: 

```
$ docker run -it jsfscan "/bin/bash"
```

After that an interactive bash session should be opened. 

# Usage
Target List should be with `https://` and `http://` use httpx or httprobe for this.
```
https://hackerone.com
https://github.com
```
And if you want to add cookie then edit the command at line 23 `cat $target | hakrawler -js -cookie "cookie here" -depth 2 -scope subs -plain >> jsfile_links.txt` 

**NOTE: If you feel tool is slow just comment out hakrawler line at 23 in JSFScan.sh script , but it might result in little less jsfileslinks.**

```
 _______ ______ _______ ______                          _     
(_______/ _____(_______/ _____)                        | |    
     _ ( (____  _____ ( (____   ____ _____ ____     ___| |__  
 _  | | \____ \|  ___) \____ \ / ___(____ |  _ \   /___|  _ \ 
| |_| | _____) | |     _____) ( (___/ ___ | | | |_|___ | | | |
 \___/ (______/|_|    (______/ \____\_____|_| |_(_(___/|_| |_|
                                                              
Usage: 
       -l   Gather Js Files Links
       -f   Import File Containing JS Urls
       -e   Gather Endpoints For JSFiles
       -s   Find Secrets For JSFiles
       -m   Fetch Js Files for manual testing
       -o   Make an Output Directory to put all things Together
       -w   Make a wordlist using words from jsfiles
       -v   Extract Vairables from the jsfiles
       -d   Scan for Possible DomXSS from jsfiles
       -r   Generate Scan Report in html
       --all Scan Everything!

```
# Check Video Here.
[![JSFScan.sh](https://img.youtube.com/vi/Z13dnarKF-w/0.jpg)](https://www.youtube.com/watch?v=Z13dnarKF-w)

## Thank You For Trying!
**Your Contribution and Suggestions are welcomed.**

**If the project helped you if any case you can buy a coffee for me ;)**

<a href="https://www.buymeacoffee.com/kathanp19" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>
