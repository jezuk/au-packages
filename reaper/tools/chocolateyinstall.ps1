
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://reaper.fm/files/7.x/reaper784-install.exe'
$checksum32 = '97e863ad55ca13cde5d783d9d8ca3c25ba19392a8fdb813213d4f228602a3562'
$url64 = 'https://reaper.fm/files/7.x/reaper784_x64-install.exe'
$checksum64 = 'a343286bd67d8515b561e5c6b7cc284a8d258d87a73f5518ec2e233d46ff9755'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url32
  url64bit       = $url64

  softwareName   = 'reaper*'

  checksum       = $checksum32
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'


  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
