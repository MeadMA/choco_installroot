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
  silentArgs             = '/passive /norestart'
  validExitCodes         = @(0,3010)
  softwareName           = 'InstallRoot'
}
Install-ChocolateyPackage @packageArgs
