#!/bin/bash

if [ -e ~/Documents/.QuickScript ]; then
    cd ~/Documents/.QuickScript/Things
fi


show() {
    id=$1
    query=$2
    filter=$3

    if [ "$1" == "" -a "$2" == "" -a "$3" == "" ]; then
        clear
        echo "******************* ID 输入示例 ********************"
        echo "内建的 ID 列表:"
        echo "inbox", "today", "anytime", "upcoming", "someday", "logbook", 
        echo "tomorrow", "deadlines", 
        echo "repeating", "all-projects", "logged-projects".
        echo ""
        echo "区域, 项目, 标签, 代办的具体 ID: "
        echo "例如: 53C5D84F-5EAF-4BC2-9A59-5A949F98A406-20200702"
        echo ""
        echo "或者不输入"
        echo "****************************************************"
        read -p "请输入 id: " id
        read -p "请输入 query: " query
        read -p "请输入 filter: " filter
    fi
    
    python3 ./things_utils/things.py -i "$id" -q "$query" -f "$filter"
}

start() {
    while :
    do
        if [ "$PARAM1" == "" ]; then
            clear
            echo "******************* Things Mode ********************"
            printf "命令\n"
            printf " \033[32m %s \033[0m %s \t\t %s \n" "s " "(show)" "进入显示模式"
            printf " \033[32m %s \033[0m %s \t %s \n" "t " "(show today)" "显示今天的所有代办"
            printf " \033[32m %s \033[0m %s \t %s \n" "w " "(show work)" "显示任意时间的工作代办"
            printf " \033[32m %s \033[0m %s \t\t %s \n" "q " "(quit)" "退出当前脚本"
            echo "****************************************************"
            read -p "请输入指令: " PARAM1  
        fi
        case $PARAM1 in
            "s") show ;;
            "t") show "today" ;;
            "w") show "anytime" "" "工作" ;;
            "q") 
                echo "see you!"
                exit 
            ;;
            *)
                echo "命令有误..."
            ;;
        esac
        printf "\n按下任意键继续: "
        read -s -n 1
        PARAM1=""
    done
}

PARAM1=$1
start
# show "" "阅读" ""