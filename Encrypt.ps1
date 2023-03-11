param(
    [string]$FilePath,
    [string]$ImagePath
)

if ($FilePath -eq "-h" -or $FilePath -eq "-help") {
    Write-Host "Arg1: File path, Arg2: Image path"
    return 0
}

if (!(Test-Path -Path $FilePath -PathType Leaf)) {
    Write-Host "File path $FilePath does not exist!"
    return 1
}

if (!(Test-Path -Path $ImagePath -PathType Leaf)) {
    Write-Host "Image path $ImagePath does not exist!"
    return 1
}

function IsImageExtensionValid($Image) {
    if ($Image.Extension -eq ".jpg") {
        return $true
    }

    if ($Image.Extension -eq ".png") {
        return $true
    }

    return $false
}

$ImageFile = Get-Item -Path $ImagePath
if (!(IsImageExtensionValid($ImageFile))) {
    Write-Host "The image file is not of the supported format!"
    return 1
}

[string]$ZipFileName = "/ZipedFile.zip"

Compress-Archive -Path $FilePath -DestinationPath ((Get-Location).Path + $ZipFileName)

$ZipedFile = Get-Item -Path ((Get-Location).Path + $ZipFileName)

$ZipedFileBytes = [System.IO.File]::ReadAllBytes($ZipedFile.FullName)

Add-Content -Path $ImageFile.FullName -Value $ZipedFileBytes -Encoding Byte -NoNewline

Remove-Item $ZipedFile.FullName

Write-Host "Successfully hid zip file in image!"