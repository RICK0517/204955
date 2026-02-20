@echo off
set BR=%1
if "%BR%"=="" (
  echo 用法: merge-codex codex/分支名稱
  pause
  exit /b 1
)

git status --porcelain >nul
if errorlevel 1 (
  echo 目前資料夾不是 git repo
  pause
  exit /b 1
)

echo [1/4] fetch...
git fetch --all --prune

echo [2/4] switch main + rebase pull...
git checkout main
git pull --rebase origin main

echo [3/4] merge from origin/%BR% ...
git merge --no-edit origin/%BR%

echo [4/4] push main...
git push origin main

echo Done.
pause