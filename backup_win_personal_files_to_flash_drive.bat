rem backup_win_personal_files_to_flash_drive

@echo off
SETLOCAL

rem Make sure folders 'Documents', 'Pictures', 'Videos', 'Music' are on drive C:
rem HOMEPATH=\Users\Mark Kiehl
SET DOCUMENTS = %HOMEPATH%\Documents
IF NOT EXIST "%DOCUMENTS%\." (
echo ERROR: path not found.  %DOCUMENTS%
echo Expected to see the folder 'Documents' in the folder %DOCUMENTS% but it was not found!
EXIT /B
)

echo The backup destination drive is %~d0
echo User folders of 'Documents', 'Pictures', 'Videos', 'Music', 'Desktop', 'Downloads', 'Favorites' will be copied to %~d0
echo Only new or modified files will be copied. 
echo The detailed copy operations will not be shown (please be patient).
echo When the backup is complete, make sure to properly eject the drive before you disconnect it!
echo.
echo 1 of 7   "%HOMEPATH%\Documents"
robocopy "%HOMEPATH%\Documents" %~d0\active\Documents /E /DCOPY:DA /COPY:DAT /R:0 /W:0 /B /NP /NFL /NDL /NJH
echo 2 of 7   "%HOMEPATH%\Pictures"
robocopy "%HOMEPATH%\Pictures" %~dp0active\Pictures /E /DCOPY:DA /COPY:DAT /R:2 /W:3 /B /NP /NFL /NDL /NJH
echo 3 of 7   "%HOMEPATH%\Videos"
robocopy "%HOMEPATH%\Videos" %~dp0active\Videos /E /DCOPY:DA /COPY:DAT /R:2 /W:3 /B /NP /NFL /NDL /NJH
echo 4 of 7   "%HOMEPATH%\Music"
robocopy "%HOMEPATH%\Music" %~dp0active\Music /E /DCOPY:DA /COPY:DAT /R:2 /W:3 /B /NP /NFL /NDL /NJH
echo 5 of 7   "%HOMEPATH%\Desktop"
robocopy "%HOMEPATH%\Desktop" %~dp0active\Desktop /E /DCOPY:DA /COPY:DAT /R:2 /W:3 /B /NP /NFL /NDL /NJH
echo 6 of 7   "%HOMEPATH%\Downloads"
robocopy "%HOMEPATH%\Downloads" %~dp0active\Downloads /E /DCOPY:DA /COPY:DAT /R:2 /W:3 /B /NP /NFL /NDL /NJH
echo 7 of 7   "%HOMEPATH%\Favorites"
robocopy "%HOMEPATH%\Favorites" %~dp0active\Favorites /E /DCOPY:DA /COPY:DAT /R:2 /W:3 /B /NP /NFL /NDL /NJH
ENDLOCAL
echo Backup complete
pause
EXIT /B