$path = "c:\Users\pc\Desktop\osamaweb\index.html"
$content = [System.IO.File]::ReadAllText($path)

# 1. Update Hire Me button
$old1 = '                    <button
                        class="bg-primary hover:bg-blue-600 rounded-full px-6 py-2 text-sm font-bold text-white transition-all">
                        Hire Me
                    </button>'
$new1 = '                    <a href="https://wa.me/972592216486" target="_blank"
                        class="bg-primary hover:bg-blue-600 rounded-full px-6 py-2 text-sm font-bold text-white transition-all">
                        Hire Me
                    </a>'

# 2. Update Hero Spacing
$old2 = '                <h1 class="font-display font-bold leading-tight text-white text-4xl md:text-6xl">Hi! I''m Osama
                    Emad,<br />building <br /><span class="italic text-primary font-extrabold">
                        Digital Experiences.
                    </span></h1>'
$new2 = '                <h1 class="font-display font-bold leading-tight text-white text-4xl md:text-6xl">Hi! I''m Osama
                    Emad,<br />building <br /><span class="block mt-4 italic text-primary font-extrabold">
                        Digital Experiences.
                    </span></h1>'

# 3. Update Let's Connect and See My Work buttons
$old3 = '                <div class="mt-8 flex flex-wrap gap-4">
                    <button
                        class="bg-primary hover:bg-blue-600 rounded-lg px-8 py-4 font-bold text-white shadow-lg shadow-primary/20 transition-all">
                        Let''s Connect
                    </button>
                    <button
                        class="border border-slate-700 hover:bg-slate-800 rounded-lg px-8 py-4 font-bold text-white transition-all">
                        See My Work
                    </button>
                </div>'
$new3 = '                <div class="mt-8 flex flex-wrap gap-4">
                    <a href="https://wa.me/972592216486" target="_blank"
                        class="bg-primary hover:bg-blue-600 rounded-lg px-8 py-4 font-bold text-white shadow-lg shadow-primary/20 transition-all inline-block">
                        Let''s Connect
                    </a>
                    <a href="#projects"
                        class="border border-slate-700 hover:bg-slate-800 rounded-lg px-8 py-4 font-bold text-white transition-all inline-block">
                        See My Work
                    </a>
                </div>'

# 4. Update Floating Glass Cards (static, no animation)
$old4 = '                <!-- Floating Glass Cards -->
                <div class="absolute top-10 -left-4 glass p-4 rounded-xl flex items-center gap-3 animate-bounce shadow-xl"
                    style="animation-duration: 4s;">
                    <div class="size-10 rounded-lg bg-primary/20 flex items-center justify-center text-primary">
                        <span class="material-symbols-outlined">schedule</span>
                    </div>
                    <div>
                        <p class="text-xs text-slate-400">Experience</p>
                        <p class="font-bold text-white">6+ Years</p>
                    </div>
                </div>
                <div class="absolute top-1/2 -right-10 glass p-4 rounded-xl flex items-center gap-3 animate-bounce shadow-xl"
                    style="animation-duration: 5s;">
                    <div class="size-10 rounded-lg bg-emerald-500/20 flex items-center justify-center text-emerald-400">
                        <span class="material-symbols-outlined">check_circle</span>
                    </div>
                    <div>
                        <p class="text-xs text-slate-400">Projects</p>
                        <p class="font-bold text-white">50+ Done</p>
                    </div>
                </div>
                <div class="absolute bottom-10 -left-10 glass p-4 rounded-xl flex items-center gap-3 animate-bounce shadow-xl"
                    style="animation-duration: 3s;">
                    <div class="size-10 rounded-lg bg-amber-500/20 flex items-center justify-center text-amber-400">
                        <span class="material-symbols-outlined">sentiment_satisfied</span>
                    </div>
                    <div>
                        <p class="text-xs text-slate-400">Clients</p>
                        <p class="font-bold text-white">30+ Happy</p>
                    </div>
                </div>
                <div class="absolute bottom-4 right-4 glass p-4 rounded-xl flex items-center gap-3 animate-bounce shadow-xl"
                    style="animation-duration: 6s;">
                    <div class="size-10 rounded-lg bg-purple-500/20 flex items-center justify-center text-purple-400">
                        <span class="material-symbols-outlined">terminal</span>
                    </div>
                    <div>
                        <p class="text-xs text-slate-400">Experience</p>
                        <p class="font-bold text-white">10+ Years Coding</p>
                    </div>
                </div>'

$new4 = '                <!-- Floating Glass Cards -->
                <div class="absolute top-10 -left-4 glass p-4 rounded-xl flex items-center gap-3 shadow-xl">
                    <div class="size-10 rounded-lg bg-primary/20 flex items-center justify-center text-primary">
                        <span class="material-symbols-outlined">schedule</span>
                    </div>
                    <div>
                        <p class="text-xs text-slate-400">Experience</p>
                        <p class="font-bold text-white">6+ Years</p>
                    </div>
                </div>
                <div class="absolute top-1/2 -right-10 glass p-4 rounded-xl flex items-center gap-3 shadow-xl">
                    <div class="size-10 rounded-lg bg-emerald-500/20 flex items-center justify-center text-emerald-400">
                        <span class="material-symbols-outlined">check_circle</span>
                    </div>
                    <div>
                        <p class="text-xs text-slate-400">Projects</p>
                        <p class="font-bold text-white">50+ Done</p>
                    </div>
                </div>
                <div class="absolute bottom-10 -left-10 glass p-4 rounded-xl flex items-center gap-3 shadow-xl">
                    <div class="size-10 rounded-lg bg-amber-500/20 flex items-center justify-center text-amber-400">
                        <span class="material-symbols-outlined">sentiment_satisfied</span>
                    </div>
                    <div>
                        <p class="text-xs text-slate-400">Clients</p>
                        <p class="font-bold text-white">30+ Happy</p>
                    </div>
                </div>
                <div class="absolute bottom-4 right-4 glass p-4 rounded-xl flex items-center gap-3 shadow-xl">
                    <div class="size-10 rounded-lg bg-purple-500/20 flex items-center justify-center text-purple-400">
                        <span class="material-symbols-outlined">terminal</span>
                    </div>
                    <div>
                        <p class="text-xs text-slate-400">Experience</p>
                        <p class="font-bold text-white">10+ Years Coding</p>
                    </div>
                </div>'

$content = $content.Replace($old1, $new1)
$content = $content.Replace($old2, $new2)
$content = $content.Replace($old3, $new3)
$content = $content.Replace($old4, $new4)

[System.IO.File]::WriteAllText($path, $content)
Write-Host "Updates applied successfully!"
