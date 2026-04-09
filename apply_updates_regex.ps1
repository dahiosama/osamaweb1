$path = "c:\Users\pc\Desktop\osamaweb\index.html"
$content = [System.IO.File]::ReadAllText($path)

# 1. Update "Hire Me" button in nav (the one that says "Hire Me")
# Find: <button ...>Hire Me</button>
$regex1 = '(?s)<button\s+class="bg-primary hover:bg-blue-600 rounded-full px-6 py-2 text-sm font-bold text-white transition-all">[\s\r\n]*Hire Me[\s\r\n]*</button>'
$new1 = '<a href="https://wa.me/972592216486" target="_blank" class="bg-primary hover:bg-blue-600 rounded-full px-6 py-2 text-sm font-bold text-white transition-all">Hire Me</a>'
$content = [regex]::Replace($content, $regex1, $new1)

# 2. Update "Let's Connect" button
$regex2 = '(?s)<button\s+class="bg-primary hover:bg-blue-600 rounded-lg px-8 py-4 font-bold text-white shadow-lg shadow-primary/20 transition-all">[\s\r\n]*Let''s Connect[\s\r\n]*</button>'
$new2 = '<a href="https://wa.me/972592216486" target="_blank" class="bg-primary hover:bg-blue-600 rounded-lg px-8 py-4 font-bold text-white shadow-lg shadow-primary/20 transition-all inline-block">Let''s Connect</a>'
$content = [regex]::Replace($content, $regex2, $new2)

# 3. Update "See My Work" button
$regex3 = '(?s)<button\s+class="border border-slate-700 hover:bg-slate-800 rounded-lg px-8 py-4 font-bold text-white transition-all">[\s\r\n]*See My Work[\s\r\n]*</button>'
$new3 = '<a href="#projects" class="border border-slate-700 hover:bg-slate-800 rounded-lg px-8 py-4 font-bold text-white transition-all inline-block">See My Work</a>'
$content = [regex]::Replace($content, $regex3, $new3)

# 4. Clean up Hero Spacing if it created extra newlines
$regex4 = '(?s)<span class="block mt-4 italic text-primary font-extrabold">[\s\r\n]*Digital Experiences.[\s\r\n]*</span>'
$new4 = '<span class="block mt-4 italic text-primary font-extrabold">Digital Experiences.</span>'
$content = [regex]::Replace($content, $regex4, $new4)

# 5. Remove bounce from glass cards
$content = $content.Replace('animate-bounce ', '')
$content = $content.Replace(' animate-bounce', '')
$content = [regex]::Replace($content, 'style="animation-duration: \d+s;"', '')

[System.IO.File]::WriteAllText($path, $content)
Write-Host "Updates applied with Regex!"
