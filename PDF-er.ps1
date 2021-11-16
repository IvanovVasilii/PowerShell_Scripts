#Makes BackUp copies of PDF files, keeping the folder structure
# (Folders that do not contain PDF files are not copied)
#
#Setting path for BackUp folder
$backDir = Join-Path $pwd.path BackUp
#Making sure BackUp folder exists
New-Item -Path $backDir -Force -ItemType Directory
#Copying folder structure
Get-ChildItem * -Exclude $backDir -Recurse| 
Where-Object {$_.extension -eq ".pdf"} | 
New-Item -Path {Join-Path $backDir ("$_" | Resolve-Path -Relative | split-path -parent)} -Force -ItemType Directory
#Copying PDF files
Get-ChildItem * -Exclude $backDir -Recurse| 
Where-Object {$_.extension -eq ".pdf"} | 
Copy-Item -Path {$_.FullName} -Destination {Join-Path $backDir ("$_" | Resolve-Path -Relative)} -Force