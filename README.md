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
#### Using PowerShell
Execute the following command **with the administrator's privilege:**

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/tats-u/enable-luajitlatex/master/enable-luajitlatex.ps1"))
```

#### Using CMD
Execute the following command **with the administrator's privilege:**

```bat
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/tats-u/enable-luajitlatex/master/enable-luajitlatex.ps1'))"
```

#### Using Git Bash
First, run Git Bash **with the administrator's privilege.**  Second, execute the following command:

``` bash
curl -LsSf https://raw.githubusercontent.com/tats-u/enable-luajitlatex/master/enable-luajitlatex.sh | sh
```

