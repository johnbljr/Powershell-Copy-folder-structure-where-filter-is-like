<#
------------------------------------------------------------
Author: John Leger
Date: March 5, 2019
Powershell Version Built/Tested on: 5.1
Title: Copy folder structure where filter is like...
Website: https://github.com/johnbljr
License: GNU General Public License v3.0
------------------------------------------------------------
#>  

$sourceDir = '\\server\share\sourcedirectory'
$targetDir = '\\server\copyto'

Get-ChildItem $sourceDir -recurse| Where-Object {$_.name -like "*test*"} | `
    foreach{ 
        $targetFile = $targetDir + $_.FullName.SubString($sourceDir.Name); 
        New-Item -ItemType Directory -Path $targetFile -Force;  
        Copy-Item $_.FullName -destination $targetFile 
    } 