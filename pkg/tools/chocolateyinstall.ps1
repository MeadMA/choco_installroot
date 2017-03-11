$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName            = 'installroot'
  fileType               = 'msi'
  url                    = 'http://iasecontent.disa.mil/pki-pke/InstallRoot_5.0.1x32.msi'
  url64bit               = 'http://iasecontent.disa.mil/pki-pke/InstallRoot_5.0.1x64.msi'
  checksum               = '2CA27C3708A37FE94928EB9200CEC6DC61977654C1EEC0FB57DB98D341AA8D01'
  checksum64             = 'BC749C6D1AFC685A3AD29EF0CE9088AFFEBE3E3726254DDA701247CF4E80170C'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/passive /norestart'
  validExitCodes         = @(0,3010)
  softwareName           = 'InstallRoot'
}
Install-ChocolateyPackage @packageArgs
