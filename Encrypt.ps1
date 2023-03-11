param(
    [string]$FilePath,
    [string]$ImagePath,
    [string]$OutputPath = (Get-Location).Path
)

if ($FilePath -eq "-h" || $FilePath -eq "-help") {
    Write-Host "Arg1: File path, Arg2: Image path, Arg3: Output path"
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
if (!IsImageExtensionValid($ImageFile)) {
    Write-Host "The image file is not of the right format!"
    return 1
}

Compress-Archive -Path $FilePath -DestinationPath ((Get-Location).Path + "/fileName")

$ZipedFile = Get-Item -Path ((Get-Location).Path + "/fileName.zip")

Copy-Item /B $ImageFile.Name+$ZipedFile.Name ($OutputPath + "/image2.jpg")

Remove-Item $ZipedFile.FullName

Write-Host "Succsessfully hid zip file in image!"