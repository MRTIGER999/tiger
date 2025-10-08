#!/bin/bash

trap 'printf "\n"; partial; exit 1' 2

partial() {
    if [[ -e $username.txt ]]; then
        printf "[*] Saved: %s.txt\n" $username
    fi
}

scanner() {
    read -p "[?] Input Username: " username

    if [[ -e $username.txt ]]; then
        printf "[*] Removing previous file: %s.txt\n" $username
        rm -rf $username.txt
    fi
    
    printf "\n"
    printf "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠛⣉⣉⣥⣤⣤⣤⣤⣤⣤⣤⣈⣉⡙⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⣡⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⡉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢋⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠟⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠙⢿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⠟⢁⣴⣿⣿⣿⣿⠿⣻⣿⣿⣿⣿⣿⣿⡿⠟⠛⠛⢛⣛⣛⡛⠛⠿⢿⣿⣿⣿⣿⣿⣿⡻⢿⣿⣿⣿⣷⣄⠹⣿⣿⣿⣿⣿
⣿⣿⣿⡿⠋⣰⣿⡿⠿⠟⠉⣠⣾⣿⣿⣿⠟⣋⣿⡿⣫⣴⡾⣱⣿⢸⣧⢻⣶⣍⠲⣮⣝⡻⢿⣿⣿⣿⣦⠈⠙⠛⢿⣿⣦⠈⢿⣿⣿⣿
⣿⣿⡿⠁⣼⣿⠋⣰⠃⢀⠜⣿⣿⡿⢋⣴⣟⡻⢋⣼⣿⣿⢡⣿⣿⣼⣿⣆⢻⣿⣷⡌⢿⣛⣧⣝⢿⣿⣿⡁⡄⠈⢧⠙⢿⣷⡀⢻⣿⣿
⣿⣿⠁⣾⠟⡅⠀⡧⠒⠁⣼⣿⢏⣴⣿⣿⡿⢣⣾⣾⣿⡅⣿⠋⠡⢌⠉⢻⣾⣿⣶⣿⣎⢻⣿⣿⣷⣝⢿⣷⡈⠓⢬⡄⠈⡙⣷⡀⢻⣿
⣿⠃⣼⡏⢸⡇⠈⢀⡄⣾⡿⣡⣿⣿⣿⣿⢣⣿⣿⣿⣿⣷⣿⣷⣾⠈⣀⣼⣿⣿⣿⣿⣿⡎⢿⣿⣿⣿⣎⢻⣿⡀⡀⠁⢀⡇⠘⣷⠈⣿
⡟⢠⣿⠁⠀⡇⠔⠉⣸⣿⢡⣿⣿⣭⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢼⣿⣿⣿⣿⣿⣿⣿⣿⣼⣟⣿⣿⣿⡆⢿⣧⠈⠳⣘⡇⠀⣿⡇⢸
⠃⢸⠏⡄⠀⠇⢀⣴⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣄⣀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡘⣿⡇⠀⠘⠃⢀⡿⣿⠈
⠀⣿⠀⢿⡀⢠⡞⢸⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢻⣇⠹⣄⠀⣼⠃⣿⡀
⠀⣿⡀⠈⣧⡏⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠉⢠⣿⠆⠐⢾⡇⠈⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢾⣿⡀⠙⣦⠃⠀⣿⡇
⠀⣿⣧⠀⠸⠀⢰⢻⣿⠻⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⣼⣿⡏⠸⣿⣿⠀⠀⠀⠀⠀⠈⢹⣿⣿⣿⣿⣿⡇⣾⡿⣇⠀⡏⠀⣸⣿⠁
⡄⢸⠈⢷⡄⠀⡿⠀⣿⡇⢿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⣿⡟⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⢁⣿⠃⢹⡀⢀⣼⠃⣿⠀
⣧⠘⣧⠀⠙⢦⡇⠀⠙⢿⡜⣿⢟⣛⣭⠀⠀⠀⠀⠀⠀⠀⠀⢻⡇⠀⡿⠁⠀⠀⠀⠀⠀⠀⠀⣭⣝⣛⠿⠏⣾⢏⠀⢸⡥⠋⠁⣰⡇⢸
⣿⡄⢻⡷⣄⠀⠃⠀⢸⠈⢷⡙⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⢏⡼⠃⣾⠀⠘⠁⢀⢼⡿⢀⣿
⣿⣷⡀⢿⡈⠳⣤⡀⠘⡇⠈⢿⣮⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣣⣾⠃⢠⡇⢀⣠⠶⢋⣼⠃⣼⣿
⣿⣿⣷⡀⢻⣄⡀⠉⠓⠾⡀⠘⡌⠻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠟⢩⠆⠀⡼⠚⠋⠁⣠⡾⠃⣼⣿⣿
⣿⣿⣿⣷⡄⠹⣿⡢⣄⣀⡀⠀⠙⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠏⠀⢀⣀⣠⠴⣾⡟⢁⣼⣿⣿⣿
⣿⣿⣿⣿⣿⣦⡈⢿⣦⣉⠉⠛⠛⠚⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠃⠚⠛⠉⢉⣤⡾⠋⣠⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣄⡙⠿⣿⡒⠶⠦⠶⠶⠾⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⠶⠶⠴⠶⢖⣾⡿⠋⣠⣾⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣈⠛⢷⣦⣤⣄⣤⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⣤⣤⣤⡶⠟⢉⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣈⠙⠻⠿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡿⠿⠛⣉⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿\n" $username
    printf "\n"
    printf "\n" 
    printf "# Creator MR %sTIGER\n" $username
    printf "# Telegram %s@username19029 \n" $username
    printf "# Version %s1.3.0 \n" $username
    printf "# GitHub %sMRTIGER999 \n" $username


    
    printf "[+] Instagram: "
    check_insta=$(curl -s -H "Accept-Language: en" "https://www.instagram.com/$username" -L | grep -o 'The link you followed may be broken'; echo $?)
    if [[ $check_insta == *'1'* ]]; then
        printf "Found! https://www.instagram.com/%s\n" $username
        printf "https://www.instagram.com/%s\n" $username > $username.txt
    else
        printf "Not Found!\n"
    fi

   
    printf "[+] Facebook: "
    check_face=$(curl -s "https://www.facebook.com/$username" -L -H "Accept-Language: en" | grep -o 'not found'; echo $?)
    if [[ $check_face == *'1'* ]]; then
        printf "Found! https://www.facebook.com/%s\n" $username
        printf "https://www.facebook.com/%s\n" $username >> $username.txt
    else
        printf "Not Found!\n"
    fi

    
    printf "[+] Twitter: "
    check_twitter=$(curl -s "https://www.twitter.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)
    if [[ $check_twitter == *'1'* ]]; then
        printf "Found! https://www.twitter.com/%s\n" $username
        printf "https://www.twitter.com/%s\n" $username >> $username.txt
    else
        printf "Not Found!\n"
    fi

    
    printf "[+] YouTube: "
    check_youtube=$(curl -s "https://www.youtube.com/$username" -L -H "Accept-Language: en" | grep -o 'Not Found'; echo $?)
    if [[ $check_youtube == *'1'* ]]; then
        printf "Found! https://www.youtube.com/%s\n" $username
        printf "https://www.youtube.com/%s\n" $username >> $username.txt
    else
        printf "Not Found!\n"
    fi

    
    printf "[+] GooglePlus: "
    check=$(curl -s "https://plus.google.com/+$username/posts" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404' ; echo $?)
    if [[ $check == *'1'* ]]; then
        printf "Found! https://plus.google.com/+%s/posts\n" $username
        printf "https://plus.google.com/+%s/posts\n" $username >> $username.txt
    else
        printf "Not Found!\n"
    fi

   
    printf "[+] Wordpress: "
    check1=$(curl -s -i "https://$username.wordpress.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Do you want to register' ; echo $?)
    if [[ $check1 == *'0'* ]] ; then 
        printf "Not Found!\n"
    else
        printf "Found! https://%s.wordpress.com\n" $username
        printf "https://%s.wordpress.com\n" $username >> $username.txt
    fi

   
    printf "[+] GitHub: "
    check1=$(curl -s -i "https://www.github.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)
    if [[ $check1 == *'0'* ]] ; then 
        printf "Not Found!\n"
    else
        printf "Found! https://www.github.com/%s\n" $username
        printf "https://www.github.com/%s\n" $username >> $username.txt
    fi

    
    printf "[+] About.me: "
    check1=$(curl -s -i "https://about.me/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
    if [[ $check1 == *'0'* ]] ; then 
        printf "Not Found!\n"
    else
        printf "Found! https://about.me/%s\n" $username
        printf "https://about.me/%s\n" $username >> $username.txt
    fi

    
    printf "[+] Spotify: "
    check1=$(curl -s -i "https://open.spotify.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)
    if [[ $check1 == *'0'* ]] ; then 
        printf "Not Found!\n"
    else
        printf "Found! https://open.spotify.com/user/%s\n" $username
        printf "https://open.spotify.com/user/%s\n" $username >> $username.txt
    fi

    
    printf "[+] GoodReads: "
    check1=$(curl -s -i "https://www.goodreads.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
    if [[ $check1 == *'0'* ]] ; then 
        printf "Not Found!\n"
    else
        printf "Found! https://www.goodreads.com/%s\n" $username
        printf "https://www.goodreads.com/%s\n" $username >> $username.txt
    fi

    
    printf "[+] LiveJournal: "
    check1=$(curl -s -i "https://$username.livejournal.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
    if [[ $check1 == *'0'* ]] ; then 
        printf "Not Found!\n"
    else
        printf "Found! https://%s.livejournal.com\n" $username
        printf "https://%s.livejournal.com\n" $username >> $username.txt
    fi

   
    printf "[+] AngelList: "
    check1=$(curl -s -i "https://angel.co/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
    if [[ $check1 == *'0'* ]] ; then 
        printf "Not Found!\n"
    else
        printf "Found! https://angel.co/%s\n" $username
        printf "https://angel.co/%s\n" $username >> $username.txt
    fi

   
    printf "[+] Roblox: "
    check1=$(curl -s -i "https://www.roblox.com/user.aspx?username=$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)
    if [[ $check1 == *'0'* ]] ; then 
        printf "Not Found!\n"
    else
        printf "Found! https://www.roblox.com/user.aspx?username=%s\n" $username
        printf "https://www.roblox.com/user.aspx?username=%s\n" $username >> $username.txt
    fi

    
    printf "[+] Canva: "
    check1=$(curl -s -i "https://www.canva.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)
    if [[ $check1 == *'0'* ]] ; then 
        printf "Not Found!\n"
    else
        printf "Found! https://www.canva.com/%s\n" $username
        printf "https://www.canva.com/%s\n" $username >> $username.txt
    fi

   
    printf "[+] CreativeMarket: "
    check1=$(curl -s -i "https://creativemarket.com/$username" -H "Accept-Language: en" -L | grep -o '404eef72' ; echo $?)
    if [[ $check1 == *'0'* ]] ; then 
        printf "Not Found!\n"
    else
        printf "Found! https://creativemarket.com/%s\n" $username
        printf "https://creativemarket.com/%s\n" $username >> $username.txt
    fi


    printf "[+] HackerNews: "
    check1=$(curl -s -i "https://news.ycombinator.com/user?id=$username" -H "Accept-Language: en" -L | grep -o 'No such user' ; echo $?)
    if [[ $check1 == *'0'* ]] ; then 
        printf "Not Found!\n"
    else
        printf "Found! https://news.ycombinator.com/user?id=%s\n" $username
        printf "https://news.ycombinator.com/user?id=%s\n" $username >> $username.txt
    fi


    partial
}

scanner