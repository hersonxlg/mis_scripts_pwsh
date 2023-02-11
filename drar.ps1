# ***********************************************************
#               Descomprime Archivos PDF:
# ***********************************************************
#
# Descripcion:  Este escript toma todos los archivos ".rar" que
#               se encuentren en el directorio de trabajo y los
#               descomprime para buscar todos los archivos ".pdf"
#               que se extraiga, luego mueve el archivo ".rar" a 
#               una carpeta llamada "_Archivos_RAR".

mkdir '_temp'
mkdir '_descomprimido'
mkdir '_Archivos_RAR'

Get-ChildItem *.rar | ForEach-Object {
    tar -xvf $_ -C .\_temp
    Get-ChildItem -Recurse .\_temp\*.pdf | Move-Item -Destination .\_descomprimido
    Remove-Item -Recurse .\_temp\*
    Move-Item $_ '.\_Archivos_RAR'
}

Move-Item '.\_descomprimido\*' '.'
Remove-Item -Recurse '_temp'
Remove-Item -Recurse '_descomprimido'

