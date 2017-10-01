@echo off

::путь
set p_gothic="D:\Gothic Mod\Gothic II Addon"
set p=%p_gothic%"\_work\data\Scripts"

DEL /F /Q %p_gothic%"\*.DMP"

copy PrjGothic\gothic.dat	%p%"\_compiled\Mushroomers.dat" /y
copy PrjGothic\ou.bin		%p%"\Content\Cutscene\OU_MR.bin" /y

pause