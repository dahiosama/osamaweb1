$f = "c:\Users\pc\Desktop\osamaweb\index.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)

$results = @{
    "1_NavDropdown"  = $c.Contains("nav-menu-dropdown")
    "2a_MobileGrid"  = $c.Contains("grid-cols-1 sm:grid-cols-2 md:grid-cols-3")
    "2b_StatsPad"    = $c.Contains("gap-6 md:gap-8 py-8 md:py-12")
    "2c_CounterData" = $c.Contains("data-target=`"6`"")
    "3_Services"     = $c.Contains("Service Card 1")
    "4_HireWhatsApp" = $c.Contains("inline-flex items-center gap-2")
    "5_CounterJS"    = $c.Contains("animateCounter")
}

$allPass = $true
foreach ($key in $results.Keys | Sort-Object) {
    $val = $results[$key]
    $status = if ($val) { "OK" } else { "MISSING" }
    if (-not $val) { $allPass = $false }
    Write-Host "$key => $status"
}

if ($allPass) {
    Write-Host "`nALL 5 FEATURES APPLIED SUCCESSFULLY!"
}
else {
    Write-Host "`nSOME FEATURES ARE MISSING - need to re-run fixes"
}
