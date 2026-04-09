import os

with open('index.html', 'r', encoding='utf-8') as f:
    lines = f.readlines()

for i, line in enumerate(lines):
    if 'Experience' in line or '50+' in line or '30+' in line:
        print(f"Line {i+1}: {line.strip()[:100]}...")
