$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName            = 'installroot'
  fileType               = 'msi'
  url                    = 'https://dl.dod.cyber.mil/wp-content/uploads/pki-pke/msi/InstallRoot_5.5x32.msi'
  url64bit               = 'https://dl.dod.cyber.mil/wp-content/uploads/pki-pke/msi/InstallRoot_5.5x64.msi'
  checksum               = '419077BE2CE468F1A2C5B741B049ACBDCD8CCDAFFFC6208BFB8FBC22B4F5ECA0'
  checksum64             = '5247D9CB48D6312E1BC8BDC6F8D375CAAA2D59F47654746294E191AF5E215CCF'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/passive /norestart'
  validExitCodes         = @(0,3010)
  softwareName           = 'InstallRoot'
}
Install-ChocolateyPackage @packageArgs
