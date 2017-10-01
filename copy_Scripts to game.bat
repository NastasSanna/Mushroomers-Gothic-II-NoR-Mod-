@echo off

::путь
set p_gothic="D:\Gothic Mod\Gothic II Addon"
set p=%p_gothic%"\_work\data\Scripts"

DEL /F /Q %p_gothic%"\*.DMP"
DEL /S /Q "PrjGothic\*.tmp"

xcopy PrjGothic\_Intern		%p%"\Content\_Intern" 	/d /s /e /y
xcopy PrjGothic\AI		%p%"\Content\AI" 	/d /s /e /y
xcopy PrjGothic\Items		%p%"\Content\Items" 	/d /s /e /y
xcopy PrjGothic\Story		%p%"\Content\Story" 	/d /s /e /y

copy PrjGothic\gothic.src	%p%"\Content\Mushroomers.src" /y

xcopy PrjVisualFX\VisualFX		%p%"\System\VisualFX" 	/d /s /e /y
copy PrjVisualFX\VisualFX.src	%p%"\System\VisualFX_MR.src" /y

xcopy PrjParticleFX\PFX		%p%"\System\PFX" 	/d /s /e /y
copy PrjParticleFX\ParticleFX.src	%p%"\System\ParticleFX_MR.src" /y

xcopy PrjMenu\_Intern		%p%"\System\_Intern" 	/d /s /e /y
xcopy PrjMenu\Menu		%p%"\System\Menu" 	/d /s /e /y
copy PrjMenu\Menu.src	%p%"\System\Menu_MR.src" /y

xcopy PrjSFX\SFX\SfxInst_MR.d		%p%"\System\SFX\SfxInst_MR.d" 	/d /s /e /y
copy PrjSFX\SFX.src	%p%"\System\SFX_MR.src" /y


pause