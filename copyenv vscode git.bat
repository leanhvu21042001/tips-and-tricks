# Copy env
$source = "C:\Users\leanh\Documents\cehsoft"
$destination = "C:\Users\leanh\Documents\cehsoft\copyenv"

Get-ChildItem $source -Directory | Where-Object {
    $_.Name -ne "copyenv"
} | ForEach-Object {

    $project = $_

    Get-ChildItem $project.FullName -File -Force -Recurse |
        Where-Object {
            $_.Name -like ".env*"
        } |
        ForEach-Object {

            $envFile = $_

            # Lấy đường dẫn tương đối so với project
            $relativePath = $envFile.FullName.Substring(
                $project.FullName.Length + 1
            )

            $target = Join-Path `
                (Join-Path $destination $project.Name) `
                $relativePath

            $targetDir = Split-Path $target -Parent

            New-Item -ItemType Directory -Path $targetDir -Force | Out-Null

            Copy-Item `
                -Path $envFile.FullName `
                -Destination $target `
                -Force

            Write-Host "Copied: $($project.Name)\$relativePath"
        }
}



# Copy .vscode and .git

$source = "C:\xampp\htdocs"
$destination = "C:\xampp\htdocs\folderscopied"

Get-ChildItem $source -Directory -Force | Where-Object {
    $_.Name -ne "folderscopied"
} | ForEach-Object {

    $project = $_
    $targetProject = Join-Path $destination $project.Name

    $foldersToCopy = @(".vscode", ".git")

    foreach ($folderName in $foldersToCopy) {

        $sourceFolder = Join-Path $project.FullName $folderName

        if (Test-Path $sourceFolder -PathType Container) {

            $targetFolder = Join-Path $targetProject $folderName

            New-Item -ItemType Directory -Path $targetProject -Force | Out-Null

            Copy-Item `
                -Path $sourceFolder `
                -Destination $targetFolder `
                -Recurse `
                -Force

            Write-Host "Copied: $($project.Name)\$folderName"
        }
    }
}
