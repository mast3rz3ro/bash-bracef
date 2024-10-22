#!/bin/env bash

f{()
{ # revision 1.0
# This function are licensed under GNU GPL-2.0-only
# Using this function will enforce you to follow the GNU GPL-2.0-only license.

	if [ "$3" = "}" ]; then
		:
	elif [ "$4" = "}" ]; then
		:
	elif [ "$5" = "}" ]; then
		echo "missing qoutes: f{" $@
		return 1
	else
		echo "missing close brace: f{" $@
		return 1
	fi
		local x
		local y
		local m
	if [[ "$1" = "-"* ]] && [[ "$2" = *" || "* ]]; then
		x="${2% ||*}"
		y="${2##*|| }"
		o="$1"
		m="1o"
		#echo "x: '$x' y: '$y' o: '$o'"
	elif [[ "$1" = "-"* ]] && [[ "$2" = *" && "* ]]; then
		x="${2% &&*}"
		y="${2##*&& }"
		o="$1"
		m="1n"
		#echo "x: '$x' y: '$y' o: '$o'"
	elif [[ "$1" != "-"* ]] && [[ "$3" = *" || "* ]]; then
		x="$1"
		y="$3"
		o="$2"
		m="2o"
	elif [[ "$1" != "-"* ]] && [[ "$3" = *" && "* ]]; then
		x="$1"
		y="$3"
		o="$2"
		m="2n"
	else
		echo "incorrect syntax: f{" $@; return 1
	fi

	if [ "$m" = "1o" ]; then
		if [ "$o" = "-z" ]; then if [ -z "$x" ] || [ -z "$y" ]; then return 0; else return 1; fi
		elif [ "$o" = "-n" ]; then if [ -n "$x" ] || [ -n "$y" ]; then return 0; else return 1; fi
		elif [ "$o" = "-f" ]; then if [ -f "$x" ] || [ -f "$y" ]; then return 0; else return 1; fi
		elif [ "$o" = "-d" ]; then if [ -d "$x" ] || [ -d "$y" ]; then return 0; else return 1; fi
		elif [ "$o" = "-s" ]; then if [ -s "$x" ] || [ -s "$y" ]; then return 0; else return 1; fi
		else echo "unspecified opreator: '$o'"; return 1
		fi
	elif [ "$m" = "1n" ]; then
		if [ "$o" = "-z" ]; then if [ -z "$x" ] && [ -z "$x" ]; then return 0; else return 1; fi
		elif [ "$o" = "-n" ]; then if [ -n "$x" ] && [ -n "$y" ]; then return 0; else return 1; fi
		elif [ "$o" = "-f" ]; then if [ -f "$x" ] && [ -f "$y" ]; then return 0; else return 1; fi
		elif [ "$o" = "-d" ]; then if [ -d "$x" ] && [ -d "$y" ]; then return 0; else return 1; fi
		elif [ "$o" = "-s" ]; then if [ -s "$x" ] && [ -s "$y" ]; then return 0; else return 1; fi
		else echo "unspecified opreator: '$o'"; return 1
		fi
	elif [ "$m" = "2o" ]; then
		if [ "$o" = "=" ]; then if [[ "$y" = "$x ||"* ]] || [[ "$y" = *"|| $x" ]]; then return 0; else return 1; fi
		elif [ "$o" = "!=" ]; then if [[ "$y" != "$x ||"* ]] || [[ "$y" != *"|| $x" ]]; then return 0; else return 1; fi
		else echo "unspecified opreator: '$o'"; return 1
		fi
	elif [ "$m" = "2n" ]; then
		if [ "$o" = "=" ]; then if [[ "$y" = "$x &&"* ]] && [[ "$y" = *"&& $x" ]]; then return 0; else return 1; fi
		elif [ "$o" = "!=" ]; then if [[ "$y" != "$x &&"* ]] && [[ "$y" != *"&& $x" ]]; then return 0; else return 1; fi
		else echo "unspecified opreator: '$o'"; return 1
		fi
	else
		echo "unexpected operation: f{" $@; return 1
	fi

}
