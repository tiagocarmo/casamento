$report = @();
$threshold = (Get-Date).AddDays(-7);
# WinRAR temp files: common archive extensions
Get-ChildItem -Path $env:TEMP -Include *.rar,*.zip,*.7z,*.tar,*.gz,*.iso -File -Recurse | Where-Object {$_.LastWriteTime -lt $threshold} | ForEach-Object {
    $report += "Deleted WinRAR temp: $($_.FullName) (LastWrite: $($_.LastWriteTime))";
    Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue;
};
# FileZilla temp files (likely prefixed with fz)
Get-ChildItem -Path $env:TEMP -Filter 'fz*' -File -Recurse | Where-Object {$_.LastWriteTime -lt $threshold} | ForEach-Object {
    $report += "Deleted FileZilla temp: $($_.FullName) (LastWrite: $($_.LastWriteTime))";
    Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue;
};
# Delete FileZilla logs older than 30 days
$fzLogPath = Join-Path $env:APPDATA 'FileZilla\Logs';
if (Test-Path $fzLogPath) {
    Get-ChildItem -Path $fzLogPath -File | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | ForEach-Object {
        $report += "Deleted FileZilla log: $($_.FullName) (LastWrite: $($_.LastWriteTime))";
        Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue;
    };
};
# Clear WinRAR registry entries (ArcHistory and DialogEditHistory)
try {
    $arcKey = 'HKCU:\Software\WinRAR\ArcHistory';
    if (Test-Path $arcKey) { Remove-Item $arcKey -Recurse -Force; $report += 'Cleared WinRAR registry ArcHistory'; };
    $dlgKey = 'HKCU:\Software\WinRAR\DialogEditHistory';
    if (Test-Path $dlgKey) { Remove-Item $dlgKey -Recurse -Force; $report += 'Cleared WinRAR registry DialogEditHistory'; };
} catch { $report += "Error clearing WinRAR registry: $_" }
# Write report
$reportPath = 'C:\WORK\cleanup_report.txt';
$report | Out-File -FilePath $reportPath -Encoding UTF8;
Write-Output "Cleanup complete. Report written to $reportPath";
