# ***********************************************************
#               Descomprime Archivos PDF:
# ***********************************************************
#
# Descripcion:  Este escript toma todos los archivos ".rar" que
#               se encuentren en el directorio de trabajo y los
#               descomprime para buscar todos los archivos ".pdf"
#               que se extraiga, luego mueve el archivo ".rar" a
#               una carpeta llamada "_Archivos_RAR".

mkdir '_result_descompresion'   # Resultado de la descompresion (temporalmente).
mkdir '_PDFs_descomprimidos'    # Archivos PDF que se han descomprimido (temporalmente).
mkdir '_Archivos_RAR'           # Todos los Archivos RAR que se han descomprimido (permanente).

# Listar todos los archivos RAR, para luego aplicarle un bloque de codigo a cada uno.
Get-ChildItem *.rar | ForEach-Object {
    tar -xvf $_ -C .\_result_descompresion  # Descomprimir el archivo y guardar el resultado en _result_descompresion
    Get-ChildItem -Recurse .\_result_descompresion\*.pdf | Move-Item -Destination .\_PDFs_descomprimidos
    Remove-Item -Recurse .\_result_descompresion\*
    Move-Item $_ '.\_Archivos_RAR'
}

Move-Item '.\_PDFs_descomprimidos\*' '.'
Remove-Item -Recurse '_result_descompresion'
Remove-Item -Recurse '_PDFs_descomprimidos'

