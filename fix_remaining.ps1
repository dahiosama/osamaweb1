# Fix services and Hire Me Now via line-number replacement
$filePath = "c:\Users\pc\Desktop\osamaweb\index.html"
$lines = [System.IO.File]::ReadAllLines($filePath, [System.Text.Encoding]::UTF8)

Write-Host "Total lines: $($lines.Length)"

# ───────────────────────────────────────────────────────────────
# Find services grid start (line with 'grid md:grid-cols-3 gap-8 mb-20')
# ───────────────────────────────────────────────────────────────
$svcStart = -1
$svcEnd = -1
for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i] -match 'grid md:grid-cols-3 gap-8 mb-20') {
        $svcStart = $i
        Write-Host "Services grid found at line $($i+1)"
        break
    }
}

if ($svcStart -ge 0) {
    # Find closing </div> for this grid (count open/close divs)
    $depth = 0
    for ($j = $svcStart; $j -lt $lines.Length; $j++) {
        $opens = ([regex]::Matches($lines[$j], '<div')).Count
        $closes = ([regex]::Matches($lines[$j], '</div>')).Count
        $depth += $opens - $closes
        if ($j -gt $svcStart -and $depth -le 0) {
            $svcEnd = $j
            Write-Host "Services grid ends at line $($j+1)"
            break
        }
    }
}

if ($svcStart -ge 0 -and $svcEnd -ge 0) {
    $newServiceCards = @(
        '            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-20">',
        '                <!-- Service Card 1: Mobile Development -->',
        '                <div class="relative glass p-8 rounded-2xl group overflow-hidden hover:shadow-[0_20px_50px_-20px_rgba(59,130,246,0.4)] transition-all duration-300">',
        '                    <span class="absolute -top-8 -left-4 text-[100px] font-black text-primary/5 select-none transition-transform group-hover:scale-110">01</span>',
        '                    <div class="relative z-10 flex flex-col gap-4">',
        '                        <div class="flex items-center gap-4">',
        '                            <div class="size-12 rounded-xl bg-primary/20 flex items-center justify-center text-primary shrink-0">',
        '                                <span class="material-symbols-outlined text-2xl">smartphone</span>',
        '                            </div>',
        '                            <h3 class="font-display text-xl font-bold text-white">Mobile Development</h3>',
        '                        </div>',
        '                        <p class="text-slate-400 leading-relaxed text-sm">High-performance iOS &amp; Android apps built with Flutter and Native iOS. Single codebase, premium quality.</p>',
        '                        <div class="flex flex-wrap gap-2 mt-1">',
        '                            <span class="bg-primary/10 border border-primary/20 px-3 py-1 text-[10px] rounded-full text-primary font-medium">Flutter</span>',
        '                            <span class="bg-primary/10 border border-primary/20 px-3 py-1 text-[10px] rounded-full text-primary font-medium">Swift</span>',
        '                            <span class="bg-primary/10 border border-primary/20 px-3 py-1 text-[10px] rounded-full text-primary font-medium">Dart</span>',
        '                        </div>',
        '                    </div>',
        '                </div>',
        '                <!-- Service Card 2: Web Development -->',
        '                <div class="relative glass p-8 rounded-2xl group overflow-hidden hover:shadow-[0_20px_50px_-20px_rgba(139,92,246,0.4)] transition-all duration-300">',
        '                    <span class="absolute -top-8 -left-4 text-[100px] font-black text-purple-500/5 select-none transition-transform group-hover:scale-110">02</span>',
        '                    <div class="relative z-10 flex flex-col gap-4">',
        '                        <div class="flex items-center gap-4">',
        '                            <div class="size-12 rounded-xl bg-purple-500/20 flex items-center justify-center text-purple-400 shrink-0">',
        '                                <span class="material-symbols-outlined text-2xl">language</span>',
        '                            </div>',
        '                            <h3 class="font-display text-xl font-bold text-white">Web Development</h3>',
        '                        </div>',
        '                        <p class="text-slate-400 leading-relaxed text-sm">Responsive, fast web apps crafted with modern frameworks and best practices for maximum performance.</p>',
        '                        <div class="flex flex-wrap gap-2 mt-1">',
        '                            <span class="bg-purple-500/10 border border-purple-500/20 px-3 py-1 text-[10px] rounded-full text-purple-400 font-medium">React</span>',
        '                            <span class="bg-purple-500/10 border border-purple-500/20 px-3 py-1 text-[10px] rounded-full text-purple-400 font-medium">Next.js</span>',
        '                            <span class="bg-purple-500/10 border border-purple-500/20 px-3 py-1 text-[10px] rounded-full text-purple-400 font-medium">TailwindCSS</span>',
        '                        </div>',
        '                    </div>',
        '                </div>',
        '                <!-- Service Card 3: UI/UX Design -->',
        '                <div class="relative glass p-8 rounded-2xl group overflow-hidden hover:shadow-[0_20px_50px_-20px_rgba(16,185,129,0.4)] transition-all duration-300">',
        '                    <span class="absolute -top-8 -left-4 text-[100px] font-black text-emerald-500/5 select-none transition-transform group-hover:scale-110">03</span>',
        '                    <div class="relative z-10 flex flex-col gap-4">',
        '                        <div class="flex items-center gap-4">',
        '                            <div class="size-12 rounded-xl bg-emerald-500/20 flex items-center justify-center text-emerald-400 shrink-0">',
        '                                <span class="material-symbols-outlined text-2xl">palette</span>',
        '                            </div>',
        '                            <h3 class="font-display text-xl font-bold text-white">UI/UX Design</h3>',
        '                        </div>',
        '                        <p class="text-slate-400 leading-relaxed text-sm">Creative, user-centric interfaces that are intuitive and crafted to elevate your brand identity.</p>',
        '                        <div class="flex flex-wrap gap-2 mt-1">',
        '                            <span class="bg-emerald-500/10 border border-emerald-500/20 px-3 py-1 text-[10px] rounded-full text-emerald-400 font-medium">Figma</span>',
        '                            <span class="bg-emerald-500/10 border border-emerald-500/20 px-3 py-1 text-[10px] rounded-full text-emerald-400 font-medium">Prototyping</span>',
        '                            <span class="bg-emerald-500/10 border border-emerald-500/20 px-3 py-1 text-[10px] rounded-full text-emerald-400 font-medium">Design Systems</span>',
        '                        </div>',
        '                    </div>',
        '                </div>',
        '            </div>'
    )
    $before = $lines[0..($svcStart - 1)]
    $after = $lines[($svcEnd + 1)..($lines.Length - 1)]
    $lines = $before + $newServiceCards + $after
    Write-Host "UPDATE 3: Services section replaced OK. New total: $($lines.Length)"
}
else {
    Write-Host "UPDATE 3: ERROR - Could not locate services grid boundaries"
}

# ───────────────────────────────────────────────────────────────
# Fix Hire Me Now button → WhatsApp anchor
# ───────────────────────────────────────────────────────────────
$btnLine = -1
for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i] -match '<button' -and $i + 2 -lt $lines.Length -and $lines[$i + 2] -match 'Hire Me Now') {
        $btnLine = $i
        Write-Host "Hire Me Now button found at line $($i+1)"
        break
    }
}

if ($btnLine -ge 0) {
    # Remove 4 lines (button open, class attr, text, close)
    $before = $lines[0..($btnLine - 1)]
    $after = $lines[($btnLine + 4)..($lines.Length - 1)]
    $newBtn = @(
        '                <a href="https://wa.me/972592216486" target="_blank"',
        '                    class="bg-primary hover:bg-blue-600 px-10 py-5 rounded-full font-bold text-white shadow-xl shadow-primary/20 transition-all z-10 inline-flex items-center gap-2">',
        '                    <span class="material-symbols-outlined text-xl">chat</span> Hire Me Now',
        '                </a>'
    )
    $lines = $before + $newBtn + $after
    Write-Host "UPDATE 4: Hire Me Now -> WhatsApp OK. New total: $($lines.Length)"
}
else {
    Write-Host "UPDATE 4: ERROR - Could not find button"
}

# ───────────────────────────────────────────────────────────────
# Save
# ───────────────────────────────────────────────────────────────
[System.IO.File]::WriteAllLines($filePath, $lines, [System.Text.Encoding]::UTF8)
Write-Host "File saved!"
