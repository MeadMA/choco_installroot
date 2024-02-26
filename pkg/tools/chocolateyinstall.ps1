$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName            = 'installroot'
  fileType               = 'msi'
  url                    = 'https://dl.dod.cyber.mil/wp-content/uploads/pki-pke/msi/InstallRoot_5.6x32.msi'
  url64bit               = 'https://dl.dod.cyber.mil/wp-content/uploads/pki-pke/msi/InstallRoot_5.6x64.msi'
  checksum               = '1E9996A5D0610ACF56370BC0DDC8AD830E890399C3822A2E1F1537C40099060B'
  checksum64             = '82719AEBCC5372643649F1E4BCE0242F0C4A37321703B793E116AD1993F57AE2'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/qb /norestart'
  validExitCodes         = @(0,3010)
  softwareName           = 'InstallRoot'
}

[array]$key = Get-UninstallRegistrykey $packageArgs['softwareName']
if ($key.Count -eq 1) {
  if ($key[0].DisplayVersion -eq '5.6') {
    Write-Host "Software already installed"
    return
  }
  else {
    # We need to do it this way, as PSChildName isn't available in POSHv2
    $msiId = $key[0].UninstallString -replace '^.*MsiExec\.exe\s*\/I', ''
    Uninstall-ChocolateyPackage -packageName $packageArgs['packageName'] `
      -fileType $packageArgs['fileType'] `
      -silentArgs "$msiId $($packageArgs['silentArgs'] -replace 'MsiInstall','MsiUninstall')" `
      -validExitCodes $packageArgs['validExitCodes'] `
      -file ''
  }
}
elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "This will most likely cause a 1603/1638 failure when installing InstallRoot."
  Write-Warning "Please uninstall InstallRoot before installing this package."
}

Install-ChocolateyPackage @packageArgs