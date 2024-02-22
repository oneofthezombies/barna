Write-Output "hello powershell"

# 전체 버전 정보 출력
Write-Host "Full PowerShell version information:"
$PSVersionTable

# 구체적인 버전 정보만 출력
Write-Host "PowerShell version: $($PSVersionTable.PSVersion)"
