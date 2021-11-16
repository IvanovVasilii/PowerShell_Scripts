#Makes a BackUp copies of files in the current folder that were changed more than 30 days ago
#
#Setting path for BackUp folder
$backDir = Join-Path $pwd.path BackUp
#Making sure BackUp folder exists
New-Item -Path $backDir -Force -ItemType Directory
#Setting reference date as midnight 30 days ago
$refDate = (Get-Date).AddDays(-30).Date
#Copying old files
Get-ChildItem * | 
Where-Object {$_.LastWriteTime -lt $refDate} | 
Move-Item -Path {$_.FullName} -Destination $backDir -Force