#!/bin/sh

# Copyright (C) 2016 Tats.U.
# This script is licensed under The MIT License.
# https://opensource.org/licenses/MIT

if ! which luajittex > /dev/null; then
    echo 'Error: you must add the executable `luajittex'"'"' to PATH before executing this script.' >&2
    exit 1
fi
if ! kpsewhich fmtutil.cnf > /dev/null; then
    echo "Error: \`fmtutil.cnf' can't be found." >&2
    exit 1
fi
LUAJITLATEX=`which luajittex | sed 's/tex$/latex/'`
echo `uname -s` `uname -o` | grep -qi 'm\(ingw\|sys\)' && WINDOWS=1 || WINDOWS=0
[ $WINDOWS = 1 ] && ! ( echo $LUAJITLATEX | grep -q '\.exe$' ) && LUAJITLATEX="${LUAJITLATEX}.exe"
sed -i -e '/luajitlatex/s/^#! //' `kpsewhich fmtutil.cnf` && {
    fmtutil-sys --byfmt luajitlatex &&
	[ $WINDOWS = 1 ] || {
	    cat > $LUAJITLATEX <<"EOF" &&
#!/bin/sh
exec $(echo "$0" | sed "s@[^/]\+\$@luajittex@") --fmt=luajitlatex.fmt $*
EOF
	    chmod +x $LUAJITLATEX
	}
    } && {
	echo "Succeeded to enable LuaJITLaTeX."
	echo "To use it, execute \`luajitlatex' insted of \`lualatex'."
    } || {
	echo "Failed to enable LuaJITLaTeX.">&2
	echo "Notice: this script may have to be executed by a privileged user.">&2
    }
