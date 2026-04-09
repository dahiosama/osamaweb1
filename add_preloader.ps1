$path = "c:\Users\pc\Desktop\osamaweb\index.html"
$content = [System.IO.File]::ReadAllText($path)

# Insert Preloader HTML after <body>
$preloaderHtml = '
<div id="preloader">
    <div class="loader-logo"></div>
    <div class="loader-text">Osama Emad</div>
</div>'

if ($content -match '<body[^>]*>') {
    $content = $content -replace '(<body[^>]*>)', "`$1$preloaderHtml"
}

# Insert Preloader JS before </body>
$preloaderJs = '
<script>
    window.addEventListener("load", function() {
        const loader = document.getElementById("preloader");
        if (loader) {
            loader.classList.add("preloader-hidden");
            setTimeout(() => {
                loader.remove();
            }, 800);
        }
    });
</script>'

if ($content -match '</body>') {
    $content = $content -replace '</body>', "$preloaderJs`n</body>"
}

[System.IO.File]::WriteAllText($path, $content)
Write-Host "Preloader added to index.html successfully!"
