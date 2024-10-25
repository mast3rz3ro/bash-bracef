#!/bin/env bash

# for portability reasons make sure to include the function it self into your code.
source bracef

echo "Example 1:"
x=~/.gitconfig
y=~/.git-credentials

if f{ -f "$x" AND "$y" }; then
	echo "both '$x' and '$y' are exist."
else
	echo "error missing the file '$x'."
fi

if f{ -fs "$x" AND "$y" }; then
	echo "both '$x' and '$y' are exist and not empty."
else
	echo "error the file '$x' is missing or it's empty."
fi


echo "Example 2:"
x="crab is not crap"
y="charcoal is coal"
z="crab is not crap"

if f{ "$x" =  "$y " OR "$z" }; then
	echo " '$x' are either equals to '$y' or '$z'."
else
	echo " '$x' does not equals to '$y' or '$z'."
fi


echo "Example 3:"
x="text"
y="$(echo -n "$x" | sed 's/xt/rm/')"
z="$(echo -n "$x" | sed 's/x/s/')"

if f{ "$(echo -n "$x" | sed 's/x/s/')" = "$x" OR "$y" }; then
	echo "the word '$x' are either equals to '$y' or '$z'."
else
	echo "the word '$x' are not equal to '$y' or '$z'."
fi

echo "Example 4:"
time f{ x = y AND z }; echo code:$?
