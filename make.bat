@echo off

set OUT_FILE_NAME=Resume_Fabien.Dieulle.en

REM Generate the html version
call pandoc --standalone -c style.css --from markdown --to html -o %OUT_FILE_NAME%.html resume.en.md

REM Generate the docx version
call pandoc --from markdown --to docx -o %OUT_FILE_NAME%.docx resume.en.md

REM Generate the pdf version
call pandoc --standalone --template style.tex --from markdown --to context --variable papersize=A4 -o %OUT_FILE_NAME%.tex resume.en.md
call mtxrun --result=%OUT_FILE_NAME%.pdf --script context %OUT_FILE_NAME%.tex

