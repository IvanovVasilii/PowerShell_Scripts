#Renames files in the current folder that were changed more than 30 days ago
#New name consists of: 3 characters of the old name, sequence number, extension
#
#Setting the initial value of the counter
$count = 1
# Setting reference date as midnight 30 days ago
$refDate = (Get-Date).AddDays(-30).Date
#Renaming
Get-ChildItem * | 
Where-Object {$_.LastWriteTime -lt $refDate} | 
Rename-Item -NewName { $_.BaseName.Remove(3) + $script:count++ + $_.Extension }
