#Written by kramwell.com - 18/JAN/2018
#Simple script to check the permissions of files in a folder recursively and alert any access issues.
#run this script as the user to check access with.

$errors=@()

$LogTime = Get-Date -Format "MM-dd-yyyy_HH-mm-ss"
$LogTime = "ACL-log\" + $LogTime + ".txt"
Start-Transcript -path $LogTime -append

	$HomeFolders = Get-ChildItem -Recurse -Path "C:\Folder"
	foreach ($HomeFolder in $HomeFolders) {
		$Path = $HomeFolder.FullName

		try {
				$permission = (Get-Acl $Path).Access
			}catch{
				"Access Error - $Path" 
			}					
	}
	

Stop-Transcript