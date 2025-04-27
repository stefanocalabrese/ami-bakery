<powershell>
# Configure Logs folder and starting PS Logs
mkdir c:\Logs
Set-ExecutionPolicy Bypass -Scope Process -Force
$timestamp = Get-Date -Format "yyyyMMddHHmmss"
Start-Transcript -Path "C:\Logs\bootstrap-$timestamp.log"

# Configure UAC to allow privilege elevation in remote shells
$Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'
$Setting = 'LocalAccountTokenFilterPolicy'
Set-ItemProperty -Path $Key -Name $Setting -Value 1 -Force

# Adding SSH firewall rule
New-NetFirewallRule -Name sshd -DisplayName 'Allow SSH' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

# Install AWS CLI v2
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi /qn

# Install Powershell Core 7.4.5
mkdir C:\temp
wget -Uri "https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-x64.msi" -OutFile C:\temp\PowerShell-7.4.5-win-x64.msi
msiexec.exe /package C:\temp\PowerShell-7.4.5-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1
Start-Sleep 5

# Install and configure SSH
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force
Get-Service sshd | Set-Service -StartupType Automatic
C:\'Program Files'\Amazon\AWSCLIV2\aws.exe s3 cp s3://bakery-store/config/sshd_config_win C:\ProgramData\ssh\sshd_config

$awsCommand = "C:\'Program Files'\Amazon\AWSCLIV2\aws.exe ssm get-parameter --region eu-central-1 --name /ansible/sshkey --with-decryption --query Parameter.Value"
$ansibleKey = Invoke-Expression $awsCommand
$ansibleKey = $ansibleKey -replace '"', ''
$($ansibleKey) | Out-File C:\ProgramData\ssh\administrators_authorized_keys -Encoding UTF8 -Append
$filePath = "C:\ProgramData\ssh\administrators_authorized_keys"
$content = Get-Content -Path $filePath
$content = $content + " administrator"
Set-Content -Path $filePath -Value $content

$awsCommand = "C:\'Program Files'\Amazon\AWSCLIV2\aws.exe ssm get-parameter --region eu-central-1 --name /ansible/sshkey --with-decryption --query Parameter.Value"
$ansibleKey = Invoke-Expression $awsCommand
$ansibleKey = $ansibleKey -replace '"', ''
$($ansibleKey) | Out-File C:\ProgramData\ssh\administrators_authorized_keys -Encoding UTF8 -Append
$filePath = "C:\ProgramData\ssh\administrators_authorized_keys"
$content = Get-Content -Path $filePath
$content = $content + " Admin"
Set-Content -Path $filePath -Value $content

icacls.exe "C:\ProgramData\ssh\administrators_authorized_keys" /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"
Start-Service sshd
Get-Service ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent
Restart-Service -Name sshd, ssh-agent

# Check the status of the OpenSSH services
$sshServerStatus = Get-Service -Name sshd
$sshAgentStatus = Get-Service -Name ssh-agent

# Display the status of the services
"SSH Server (sshd) status: $($sshServerStatus.Status)"
"SSH Agent (ssh-agent) status: $($sshAgentStatus.Status)"

# Download Wallpaper
C:\'Program Files'\Amazon\AWSCLIV2\aws.exe s3 cp s3://bakery-store/config/wallpaper.jpg C:\ProgramData\Amazon\EC2Launch\wallpaper\Ec2Wallpaper.jpg

# Remove default unattend.xml file
Remove-Item -Path "C:\ProgramData\Amazon\EC2Launch\sysprep\unattend.xml"
# Download custom unattend.xml file
C:\'Program Files'\Amazon\AWSCLIV2\aws.exe s3 cp s3://bakery-store/config/unattend.xml C:\ProgramData\Amazon\EC2Launch\sysprep\unattend.xml

# Remove default agent-config.yml file
Remove-Item -Path "C:\ProgramData\Amazon\EC2Launch\config\agent-config.yml"
# Download custom agent-config.yml file
$unattendContent = & "C:\Program Files\Amazon\AWSCLIV2\aws.exe" ssm get-parameter --region eu-central-1 --name /packer/ansible_windows/agent-config.yml --with-decryption --query Parameter.Value --output text
# Define the UTF-8 encoding without BOM
$utf8NoBOMEncoding = New-Object System.Text.UTF8Encoding($false)
# Write the content to the file without BOM using .NET methods
[System.IO.File]::WriteAllLines("C:\ProgramData\Amazon\EC2Launch\config\agent-config.yml", $unattendContent, $utf8NoBOMEncoding)

Remove-Item -Path "C:\temp" -Recurse -Force

# Define the registry path and value
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters"
$propertyName = "DisabledComponents"
$propertyValue = 0xff  # 255 in hexadecimal

# Define the target folder path
$folderPath = "C:\Windows\PolicyDefinitions"

# Take ownership of the folder and all subfolders/files recursively
takeown /F $folderPath /A /R /D Y

# Grant full control to the Administrators group recursively
icacls $folderPath /grant Administrators:F /T

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue

Stop-Transcript

C:\'Program Files'\Amazon\AWSCLIV2\aws.exe s3 cp "C:\Logs\bootstrap-$timestamp.log" s3://bakery-store/logs/ec2_codebuild-$timestamp.log
Remove-Item -Path "C:\Logs" -Recurse -Force

</powershell>