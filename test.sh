#!/bin/env bash

# for portability reasons make sure to include the function it self into your code.
source ./bracef.sh


echo "Example 1:"
x=~/.gitconfig
y=~/.git-credentials

if f{ -f "$x" AND "$y" }; then
	echo "the last file is exists '$x'."
else
	echo "error missing the file '$x'."
fi


echo "Example 2:"
x=~/.gitconfig
y=~/.git-credentials

if f{ -fs "$x" OR "$y" }; then
	echo "the file $x is exists."
else
	echo "error the file '$x' is missing or it's empty."
fi


echo "Example 3:"
x="crab is not crap"
y="charcoal is coal"
z="crab is not crap"

if f{ "$x" =  "$y " OR "$z" }; then
	echo " '$x' are either equals to '$y' or '$z'."
else
	echo " '$x' does not equals to '$y' or '$z'."
fi


echo "Example 4:"
x="text"
y="$(echo -n "$x" | sed 's/xt/rm/')"
z="$(echo -n "$x" | sed 's/x/s/')"

if f{ "$(echo -n "$x" | sed 's/x/s/')" = "$x" OR "$y" }; then
	echo "the word '$x' are either equals to '$y' or '$z'."
else
	echo "the word '$x' are not equal to '$y' or '$z'."
fi

echo "Speed test (x = y AND z):"
time f{ x = y AND z }; echo code:$?

echo "Speed test (x = x AND x AND x AND d):"
time f{ x = x AND x AND x AND d }; echo code:$?
