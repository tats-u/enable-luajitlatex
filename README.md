# Enable LuaJITLaTeX
## What's this?
This is a shell script for enabling LuaJITLaTeX.  LuaJITLaTeX is a mixture of LuaLaTeX and JIT. (or LaTeX and LuaJITTeX)  It works faster than LuaLaTeX in many cases.

## How to use
### Unix-like OSs
Just execute by sh by the root user.

``` bash
curl -LsSf https://raw.githubusercontent.com/tats-u/enable-luajitlatex/master/enable-luajitlatex.sh | sudo PATH="$PATH" sh
```

### Windows
This cannot be executed by the cmd or the PowerShell.  First, run Git Bash or Msys2 **with the administrator's privilege.**  Second, execute this script by these shells.

``` bash
curl -LsSf https://raw.githubusercontent.com/tats-u/enable-luajitlatex/master/enable-luajitlatex.sh | sh
```

