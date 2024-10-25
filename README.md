# bash-bracef

## A implementation allows to add one more condition in test statements. 

### How to install:

**method 1:**
```Bash
git clone "https://github.com/mast3rz3ro/bash-bracef" && cat bash-bracef/bracef.sh | sed 's/#.\/bin\/env bash//' >>~/.bashrc && echo succedd
```

**method 2 (recommended):**
```Bash
git clone "https://github.com/mast3rz3ro/bash-bracef" && cp bash-bracef/bracef.sh $PREFIX/bin/bracef && echo succedd
source bracef
```

### Examples:

**quick testing:**
```Bash
f{ x = y OR x }; echo $?
0

f{ x = y AND z }; echo $?
1

f{ x != y AND z }; echo $?
1
```

**practial testing:**

> Note: Do not call it from the script, instead include the whole function itself.


**Check if both files exists.**
**returns false if first one does not exists:**
```Bash
x=~/.gitconfig
y=~/.git-credentials

if f{ -f "$x" AND "$y" }; then
	echo "both '$x' and '$y' are exist."
else
	echo "error missing the file '$x'."
fi
```

**Check if both files exists and not empty.**
**returns false if first one does not exists or empty:**
```Bash
if f{ -fs "$x" AND "$y" }; then
	echo "both '$x' and '$y' are exist and not empty."
else
	echo "error the file '$x' is missing or it's empty."
fi
```

**Check if variable x are equal to variable y or z.**
**returns false if both y or z are not equal to x:**
```Bash
x="crab is not crap"
y="charcoal is coal"
z="crab is not crap"

if f{ "$x" =  "$y " OR "$z" }; then
	echo " '$x' are either equals to '$y' or '$z'."
else
	echo " '$x' does not equals to '$y' or '$z'."
fi
```

**Another one (try to guess what it's compares);**
```Bash
x="text"
y="$(echo -n "$x" | sed 's/xt/rm/')"
z="$(echo -n "$x" | sed 's/x/s/')"

if f{ "$(echo -n "$x" | sed 's/x/s/')" = "$x" OR "$y" }; then
	echo "the word '$x' are either equals to '$y' or '$z'."
else
	echo "the word '$x' are not equal to '$y' or '$z'."
fi
```

**Speed test:**

> FYI current revision are 1 nano second faster than previous revision.

```Bash
time f{ x = y AND z }; echo code:$?

real    0m0.001s
user    0m0.001s
sys     0m0.000s
code:1

time [ x = y ] && [ x = z ]; echo code:$?

real    0m0.000s
user    0m0.000s
sys     0m0.000s
code:1
```

### License:

**GNU GPL-2.0-only**
