@echo off
cd /d "C:\Users\lashimao\AppData\Local\Programs\cursor\hajimi"
echo Current directory: %CD%
echo Starting Hajimi with kingfall-ab-test support...
python -m pip install -r requirements.txt
python -m uvicorn app.main:app --host 127.0.0.1 --port 7860
pause