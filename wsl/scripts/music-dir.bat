# https://www.reddit.com/r/ScriptSwap/comments/7h53t2/artist_name_script/

@echo off

set DIR=C:\Users\USERNAME\Desktop
set FILE=output.txt
set TMP=tmp.txt

if exist %FILE% (
    del %FILE%
)

dir %DIR% /b /ad > %TMP%

for /f "tokens=1 delims=-" %%a in (%TMP%) do (
    echo.%%a >> %FILE%
    del %TMP%
)
