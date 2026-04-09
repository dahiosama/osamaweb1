# Portfolio Updates Script v2 - All 5 features
$filePath = "c:\Users\pc\Desktop\osamaweb\index.html"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

Write-Host "File loaded. Length: $($content.Length)"

# ============================================================
# UPDATE 1: Add navbar dropdown button before "Hire Me" button
# ============================================================
$oldNav = '<a href="https://wa.me/972592216486" target="_blank"
                class="bg-primary hover:bg-blue-600 rounded-full px-6 py-2 text-sm font-bold text-white transition-all">Hire
                Me</a>'

$newNav = '<!-- Mobile nav dropdow n -->
            <div class="relative ml-2" id="nav-menu-wrap">
                <button id="nav-menu-btn" onclick="toggleNavMenu()"
                    class="glass flex items-center gap-2 rounded-full px-4 py-2 text-sm font-medium text-white hover:text-primary transition-all focus:outline-none">
                    <span class="material-symbols-outlined text-lg" id="nav-menu-icon">menu</span>
                    <span class="hidden sm:inline">Sections</span>
                </button>
                <div id="nav-menu-dropdown"
                    class="hidden absolute right-0 top-12 z-50 min-w-[180px] glass rounded-2xl py-2 shadow-2xl shadow-black/40 border border-white/10">
                    <a href="#projects" onclick="closeNavMenu()"
                        class="flex items-center gap-3 px-5 py-3 text-sm text-slate-300 hover:text-primary hover:bg-white/5 transition-all">
                        <span class="material-symbols-outlined text-base">folder_open</span> Projects</a>
                    <a href="#services" onclick="closeNavMenu()"
                        class="flex items-center gap-3 px-5 py-3 text-sm text-slate-300 hover:text-primary hover:bg-white/5 transition-all">
                        <span class="material-symbols-outlined text-base">build</span> Services</a>
                    <a href="#process" onclick="closeNavMenu()"
                        class="flex items-center gap-3 px-5 py-3 text-sm text-slate-300 hover:text-primary hover:bg-white/5 transition-all">
                        <span class="material-symbols-outlined text-base">repeat</span> Process</a>
                    <a href="#about" onclick="closeNavMenu()"
                        class="flex items-center gap-3 px-5 py-3 text-sm text-slate-300 hover:text-primary hover:bg-white/5 transition-all">
                        <span class="material-symbols-outlined text-base">person</span> About</a>
                    <a href="#contact" onclick="closeNavMenu()"
                        class="flex items-center gap-3 px-5 py-3 text-sm text-slate-300 hover:text-primary hover:bg-white/5 transition-all">
                        <span class="material-symbols-outlined text-base">mail</span> Contact Us</a>
                </div>
            </div>
            <a href="https://wa.me/972592216486" target="_blank"
                class="bg-primary hover:bg-blue-600 rounded-full px-6 py-2 text-sm font-bold text-white transition-all">Hire
                Me</a>'

if ($content.Contains($oldNav)) {
    $content = $content.Replace($oldNav, $newNav)
    Write-Host "UPDATE 1: Navbar dropdown added OK"
}
else {
    Write-Host "UPDATE 1: ERROR - Could not find navbar hire me button"
}

# ============================================================
# UPDATE 2a: Fix projects grid for mobile
# ============================================================
$oldProjectsGrid = '<div class="grid md:grid-cols-3 gap-8">'
$newProjectsGrid = '<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-8">'

if ($content.Contains($oldProjectsGrid)) {
    $content = $content.Replace($oldProjectsGrid, $newProjectsGrid)
    Write-Host "UPDATE 2a: Projects grid mobile fix OK"
}
else {
    Write-Host "UPDATE 2a: Projects grid already fixed or not found"
}

# ============================================================
# UPDATE 2b: Fix stats row for mobile (better padding)
# ============================================================
$oldStats = '<div class="grid grid-cols-2 md:grid-cols-4 gap-8 py-12 glass rounded-3xl">'
$newStats = '<div class="grid grid-cols-2 md:grid-cols-4 gap-6 md:gap-8 py-8 md:py-12 px-4 glass rounded-3xl">'

if ($content.Contains($oldStats)) {
    $content = $content.Replace($oldStats, $newStats)
    Write-Host "UPDATE 2b: Stats row mobile fix OK"
}
else {
    Write-Host "UPDATE 2b: Stats row already fixed or not found"
}

# Fix stat number font size for mobile
$content = $content.Replace(
    '<p class="font-display text-5xl font-bold text-primary">6+</p>',
    '<p class="font-display text-3xl md:text-5xl font-bold text-primary counter" data-target="6" data-suffix="+">6+</p>'
)
$content = $content.Replace(
    '<p class="font-display text-5xl font-bold text-primary">50+</p>',
    '<p class="font-display text-3xl md:text-5xl font-bold text-primary counter" data-target="50" data-suffix="+">50+</p>'
)
$content = $content.Replace(
    '<p class="font-display text-5xl font-bold text-primary">30+</p>',
    '<p class="font-display text-3xl md:text-5xl font-bold text-primary counter" data-target="30" data-suffix="+">30+</p>'
)
$content = $content.Replace(
    '<p class="font-display text-5xl font-bold text-primary">1M+</p>',
    '<p class="font-display text-3xl md:text-5xl font-bold text-primary counter" data-target="1000000" data-suffix="M+">1M+</p>'
)
Write-Host "UPDATE 2c/5: Counter data-target attributes added OK"

# ============================================================
# UPDATE 3: Services section redesign
# ============================================================
$oldServices = '            <div class="grid md:grid-cols-3 gap-8 mb-20">
                <div class="glass p-8 rounded-2xl flex flex-col items-center text-center gap-4">
                    <div class="size-16 rounded-full bg-primary/10 flex items-center justify-center text-primary mb-2">
                        <span class="material-symbols-outlined text-4xl">language</span>
                    </div>
                    <h3 class="font-display text-2xl font-bold text-white">Web Development</h3>
                    <p class="text-slate-400 leading-relaxed">Responsive and dynamic web applications built with modern
                        frameworks and optimized for speed.</p>
                </div>
                <div class="glass p-8 rounded-2xl flex flex-col items-center text-center gap-4">
                    <div class="size-16 rounded-full bg-primary/10 flex items-center justify-center text-primary mb-2">
                        <span class="material-symbols-outlined text-4xl">devices</span>
                    </div>
                    <h3 class="font-display text-2xl font-bold text-white">Cross-Platform</h3>
                    <p class="text-slate-400 leading-relaxed">High-performance mobile apps for iOS and Android using
                        Flutter, ensuring consistent user experience.</p>
                </div>
                <div class="glass p-8 rounded-2xl flex flex-col items-center text-center gap-4">
                    <div class="size-16 rounded-full bg-primary/10 flex items-center justify-center text-primary mb-2">
                        <span class="material-symbols-outlined text-4xl">palette</span>
                    </div>
                    <h3 class="font-display text-2xl font-bold text-white">UI/UX Design</h3>
                    <p class="text-slate-400 leading-relaxed">Creative and intuitive interfaces designed to provide
                        delightful user journeys and brand impact.</p>
                </div>
            </div>'

$newServices = '            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-20">
                <!-- Service Card 1: Mobile Development -->
                <div class="relative glass p-8 rounded-2xl group overflow-hidden hover:shadow-[0_20px_50px_-20px_rgba(59,130,246,0.4)] transition-all duration-300">
                    <span class="absolute -top-8 -left-4 text-[100px] font-black text-primary/5 select-none transition-transform group-hover:scale-110">01</span>
                    <div class="relative z-10 flex flex-col gap-4">
                        <div class="flex items-center gap-4">
                            <div class="size-12 rounded-xl bg-primary/20 flex items-center justify-center text-primary shrink-0">
                                <span class="material-symbols-outlined text-2xl">smartphone</span>
                            </div>
                            <h3 class="font-display text-xl font-bold text-white">Mobile Development</h3>
                        </div>
                        <p class="text-slate-400 leading-relaxed text-sm">High-performance iOS &amp; Android apps built with Flutter and Native iOS technologies. Single codebase, premium quality.</p>
                        <div class="flex flex-wrap gap-2 mt-1">
                            <span class="bg-primary/10 border border-primary/20 px-3 py-1 text-[10px] rounded-full text-primary font-medium">Flutter</span>
                            <span class="bg-primary/10 border border-primary/20 px-3 py-1 text-[10px] rounded-full text-primary font-medium">Swift</span>
                            <span class="bg-primary/10 border border-primary/20 px-3 py-1 text-[10px] rounded-full text-primary font-medium">Dart</span>
                        </div>
                    </div>
                </div>
                <!-- Service Card 2: Web Development -->
                <div class="relative glass p-8 rounded-2xl group overflow-hidden hover:shadow-[0_20px_50px_-20px_rgba(139,92,246,0.4)] transition-all duration-300">
                    <span class="absolute -top-8 -left-4 text-[100px] font-black text-purple-500/5 select-none transition-transform group-hover:scale-110">02</span>
                    <div class="relative z-10 flex flex-col gap-4">
                        <div class="flex items-center gap-4">
                            <div class="size-12 rounded-xl bg-purple-500/20 flex items-center justify-center text-purple-400 shrink-0">
                                <span class="material-symbols-outlined text-2xl">language</span>
                            </div>
                            <h3 class="font-display text-xl font-bold text-white">Web Development</h3>
                        </div>
                        <p class="text-slate-400 leading-relaxed text-sm">Responsive, fast, and dynamic web applications crafted with modern frameworks and best practices for maximum performance.</p>
                        <div class="flex flex-wrap gap-2 mt-1">
                            <span class="bg-purple-500/10 border border-purple-500/20 px-3 py-1 text-[10px] rounded-full text-purple-400 font-medium">React</span>
                            <span class="bg-purple-500/10 border border-purple-500/20 px-3 py-1 text-[10px] rounded-full text-purple-400 font-medium">Next.js</span>
                            <span class="bg-purple-500/10 border border-purple-500/20 px-3 py-1 text-[10px] rounded-full text-purple-400 font-medium">TailwindCSS</span>
                        </div>
                    </div>
                </div>
                <!-- Service Card 3: UI/UX Design -->
                <div class="relative glass p-8 rounded-2xl group overflow-hidden hover:shadow-[0_20px_50px_-20px_rgba(16,185,129,0.4)] transition-all duration-300">
                    <span class="absolute -top-8 -left-4 text-[100px] font-black text-emerald-500/5 select-none transition-transform group-hover:scale-110">03</span>
                    <div class="relative z-10 flex flex-col gap-4">
                        <div class="flex items-center gap-4">
                            <div class="size-12 rounded-xl bg-emerald-500/20 flex items-center justify-center text-emerald-400 shrink-0">
                                <span class="material-symbols-outlined text-2xl">palette</span>
                            </div>
                            <h3 class="font-display text-xl font-bold text-white">UI/UX Design</h3>
                        </div>
                        <p class="text-slate-400 leading-relaxed text-sm">Creative, user-centric interfaces that are intuitive, accessible, and beautifully crafted to elevate your brand identity.</p>
                        <div class="flex flex-wrap gap-2 mt-1">
                            <span class="bg-emerald-500/10 border border-emerald-500/20 px-3 py-1 text-[10px] rounded-full text-emerald-400 font-medium">Figma</span>
                            <span class="bg-emerald-500/10 border border-emerald-500/20 px-3 py-1 text-[10px] rounded-full text-emerald-400 font-medium">Prototyping</span>
                            <span class="bg-emerald-500/10 border border-emerald-500/20 px-3 py-1 text-[10px] rounded-full text-emerald-400 font-medium">Design Systems</span>
                        </div>
                    </div>
                </div>
            </div>'

if ($content.Contains($oldServices)) {
    $content = $content.Replace($oldServices, $newServices)
    Write-Host "UPDATE 3: Services section redesigned OK"
}
else {
    Write-Host "UPDATE 3: ERROR - Could not find old services section"
}

# ============================================================
# UPDATE 4: "Hire Me Now" button → WhatsApp anchor link
# ============================================================
$oldHireBtn = '                <button
                    class="bg-primary hover:bg-blue-600 px-10 py-5 rounded-full font-bold text-white shadow-xl shadow-primary/20 transition-all z-10">
                    Hire Me Now
                </button>'

$newHireBtn = '                <a href="https://wa.me/972592216486" target="_blank"
                    class="bg-primary hover:bg-blue-600 px-10 py-5 rounded-full font-bold text-white shadow-xl shadow-primary/20 transition-all z-10 inline-flex items-center gap-2">
                    <span class="material-symbols-outlined text-xl">chat</span> Hire Me Now
                </a>'

if ($content.Contains($oldHireBtn)) {
    $content = $content.Replace($oldHireBtn, $newHireBtn)
    Write-Host "UPDATE 4: Hire Me Now button -> WhatsApp link OK"
}
else {
    Write-Host "UPDATE 4: ERROR - Could not find Hire Me Now button"
}

# ============================================================
# UPDATE 5: Add JS for navbar dropdown + counter animation (before </body>)
# ============================================================
$counterAndMenuScript = @'
    <script>
        // ── Navbar Dropdown ─────────────────────────────────────
        function toggleNavMenu() {
            const dropdown = document.getElementById('nav-menu-dropdown');
            dropdown.classList.toggle('hidden');
        }
        function closeNavMenu() {
            document.getElementById('nav-menu-dropdown').classList.add('hidden');
        }
        document.addEventListener('click', function (e) {
            const wrap = document.getElementById('nav-menu-wrap');
            if (wrap && !wrap.contains(e.target)) {
                closeNavMenu();
            }
        });

        // ── Counter Animation ────────────────────────────────────
        function animateCounter(el) {
            const target = parseInt(el.dataset.target, 10);
            const suffix = el.dataset.suffix || '';
            const duration = 1800;
            const start = performance.now();
            function update(now) {
                const elapsed = now - start;
                const progress = Math.min(elapsed / duration, 1);
                const eased = 1 - Math.pow(1 - progress, 3); // ease-out cubic
                const current = Math.floor(eased * target);
                // Format 1M+
                if (target >= 1000000) {
                    el.textContent = (current >= 1000000 ? '1' : '0') + suffix;
                } else {
                    el.textContent = current + suffix;
                }
                if (progress < 1) {
                    requestAnimationFrame(update);
                } else {
                    el.textContent = (target >= 1000000 ? '1' : target) + suffix;
                }
            }
            requestAnimationFrame(update);
        }

        const counters = document.querySelectorAll('.counter');
        if (counters.length > 0) {
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting && !entry.target.dataset.animated) {
                        entry.target.dataset.animated = '1';
                        animateCounter(entry.target);
                    }
                });
            }, { threshold: 0.5 });
            counters.forEach(c => observer.observe(c));
        }
    </script>
'@

$bodyClose = '</body>'
if ($content.Contains($bodyClose)) {
    $content = $content.Replace($bodyClose, $counterAndMenuScript + "`n" + $bodyClose)
    Write-Host "UPDATE 5: Counter + dropdown JS injected OK"
}
else {
    Write-Host "UPDATE 5: ERROR - Could not find </body>"
}

# ============================================================
# Save the file
# ============================================================
[System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
Write-Host "File saved successfully!"
