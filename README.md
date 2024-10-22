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
f{ x = "y || x" }; echo $?
0

f{ x = "y && z" }; echo $?
1

f{ x != "y || z" }; echo $?
1
```

**practial testing:**

`Note: Do not call it from the script, instead include the function itself.`

```Bash
x=~/.gitconfig
y=~/.git-credentials

if f{ -f "$x && $y" }; then
	echo "both $x and $y are exist."
else
	echo "error missing $x or $y or either both files."
fi
```

```Bash
x="crab is crap"
y="charcoal is coal"
z="crab is crap"

if f{ "$x" =  "$y || $z" }; then
	echo " '$x' are either equals to '$y' or '$z'."
else
	echo " '$x' does not equals to '$y' or '$z'."
fi
```

```Bash
x="text"
y="$(echo -n "$x" | sed 's/xt/rm/')"

if f{ "$(echo -n "$x" | sed 's/x/s/')" = "$x || $y" }; then
	z="$(echo -n "$x" | sed 's/x/s/')"
	echo "the word '$x' are either equals to '$y' or '$z'."
else
	z="$(echo -n "$x" | sed 's/x/s/')"
	echo "the word '$x' are not equal to '$y' or '$z'."
fi
```

**Speed test:**

```Bash
time f{ x = "y && z" }; echo code:$?

real    0m0.002s
user    0m0.002s
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
