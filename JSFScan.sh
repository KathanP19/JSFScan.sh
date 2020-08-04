#!/bin/bash

#LOgo
logo(){

echo " _______ ______ _______ ______                          _     ";
echo "(_______/ _____(_______/ _____)                        | |    ";
echo "     _ ( (____  _____ ( (____   ____ _____ ____     ___| |__  ";
echo " _  | | \____ \|  ___) \____ \ / ___(____ |  _ \   /___|  _ \ ";
echo "| |_| | _____) | |     _____) ( (___/ ___ | | | |_|___ | | | |";
echo " \___/ (______/|_|    (______/ \____\_____|_| |_(_(___/|_| |_|";
echo "                                                              ";

}
logo


#Gather JSFilesUrls
gather_js(){
echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Started Gathering JsFiles-links\e[0m\n";
cat $target | gau | grep -iE "\.js$" | uniq | sort >> jsfile_links.txt
cat $target | subjs >> jsfile_links.txt
cat $target | hakrawler -js -depth 2 -scope subs -plain >> jsfile_links.txt
cat jsfile_links.txt | httpx -silent -follow-redirects -status-code | grep 200 | awk '{print $1}' | sort -u > live_jsfile_links.txt
}

#Gather Endpoints From JsFiles
endpoint_js(){
echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Started gathering Endpoints\e[0m\n";
interlace -tL live_jsfile_links.txt -threads 5 -c "echo 'Scanning _target_ Now' ; python3 ./tools/LinkFinder/linkfinder.py -d -i _target_ -o cli >> endpoints.txt" -v
}

#Gather Secrets From Js Files
secret_js(){
echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Started Finding Secrets in JSFiles\e[0m\n";
interlace -tL live_jsfile_links.txt -threads 5 -c "python3 ./tools/SecretFinder/SecretFinder.py -i _target_ -o cli >> jslinksecret.txt" -v
}

#Collect Js Files For Maually Search
meg_gf(){
echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Started to Gather JSFiles locally for Manual Testing\e[0m\n";
mkdir jsfiles
cp live_jsfile_links.txt ./jsfiles/hosts
cd ./jsfiles/
meg -d 1000 -v /
cd ..
echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Manually Search For Secrets Using gf or grep in out/\e[0m\n";
}

#Gather JSFilesWordlist
wordlist_js(){
echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Started Gathering Words From JsFiles-links For Wordlist.\e[0m\n";
cat live_jsfile_links.txt | python3 ./tools/getjswords.py >> temp_jswordlist.txt
cat temp_jswordlist.txt | sort -u >> jswordlist.txt
rm temp_jswordlist.txt
}

#Save in Output Folder
output(){
mkdir -p $dir
mv endpoints.txt jsfile_links.txt jslinksecret.txt live_jsfile_links.txt $dir/
mv jsfiles/ $dir/
}
while getopts ":l:esmwo:" opt;do
        case ${opt} in
                l ) target=$OPTARG
                    gather_js
                    ;;
                e ) endpoint_js
                    ;;
                s ) secret_js
                    ;;
                m ) meg_gf
                    ;;
                w ) wordlist_js
                    ;;
                o ) dir=$OPTARG
                    output
                    ;;
                \? ) echo "Usage: "
                     echo "       -l   Gather Js Files Links";
                     echo "       -e   Gather Endpoints For JSFiles";
                     echo "       -s   Find Secrets For JSFiles";
                     echo "       -m   Use Meg for fetching JsFiles for manual testing";
                     echo "       -w   Make a wordlist using words from jsfiles";
                     echo "       -o   Make an Output Directory to put all things Together";
                     ;;
                : ) echo "Invalid Options $OPTARG require an argument";
                    ;;
        esac
done
shift $((OPTIND -1))
