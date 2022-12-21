#!/usr/bin/env python

# -*- coding: utf-8 -*-

import calendar
import datetime
import jpholiday
import sys

print("[This is python's area]")

def output_calendar(target="terminal"):

    # 祝日、日曜日、土曜日の色を指定
    color_code = {
        "holiday": "\033[91m",
        "sunday": "\033[91m",
        "saturday": "\033[94m",
        "happyday": "\033[41m",
        "end": "\033[0m"
    }

    # Conkyの場合
    if target == "conky":
        color_code = {
            "holiday": "${color ff8080}",
            "sunday": "${color ff8080}",
            "saturday": "${color 80c0ff}",
            "happyday": "${color 00a82d}",
            "end": "${color}"
        }

    # 週の始まりの曜日を指定
    calendar.setfirstweekday(calendar.SUNDAY)

    # 現在の年月を取得
    year = datetime.datetime.now().year
    month = datetime.datetime.now().month

    # 日付を週ごとのリストにして変数に代入
    days = calendar.monthcalendar(year, month)

    # カレンダーを出力
#    output = " {}年 {}月\n".format(str(year), str(month))
    output = " {}/ {}\n".format(str(year), str(month))
    output += " Su Mo Tu We Th Fr Sa\n"

    for line in days:
        for i in range(7):

            str_day = str(line[i]).rjust(3)

            # 値が0の場合空欄にする
            if line[i] == 0:
                output += "   "
            #当日を表示
            elif datetime.datetime.now().day == line[i]:
                output += color_code["happyday"] + str_day + color_code["end"] 

            elif jpholiday.is_holiday(datetime.date(year, month, line[i])):
                output += color_code["holiday"] + str_day + color_code["end"]

            # 日曜日の場合色分け
            elif i == 0:
                output += color_code["sunday"] + str_day + color_code["end"]

            # 土曜日の場合色分け
            elif i == 6:
                output += color_code["saturday"] + str_day + color_code["end"]

            else:
                output += str_day

        output += "\n"

    return output


if __name__ == '__main__':

    # コマンドライン引数を取得
    try:
        argument = sys.argv[1]
    except:
        argument = None

    # カレンダーを出力
    print(output_calendar(argument))
