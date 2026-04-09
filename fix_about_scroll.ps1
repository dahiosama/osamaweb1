$f = "c:\Users\pc\Desktop\osamaweb\index.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)

# Use regex to find `class="... sticky top-24 ..."` and replace it
$pattern = 'class="([^"]*)sticky top-24([^"]*)"'
if ($c -match $pattern) {
    $c = [regex]::Replace($c, $pattern, 'class="$1lg:sticky lg:top-24 relative$2"')
    [System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
    Write-Host "Fixed sticky issue using RegEx!"
}
else {
    Write-Host "String not found. Let's look closer."
    Write-Host "Matches for sticky top-24:"
    $c | Select-String "sticky top-24"
}
