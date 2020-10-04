Write-Host("Programa de exemplo para Marcos Reis:");
Write-Host("");

Write-Host("Digite o nome do programa com os parametros Usuario e Senha.");
Write-Host("Ex.: ./UsuarioSenha.ps1 Usuario Senha");
Write-Host("Ex.: ./UsuarioSenha.ps1 Marcos 123456");
Write-Host("");

$Parametro01 = $args[0]
$Parametro02 = $args[1]

if (!$Parametro01 -or !$Parametro02){
    Write-Host("Programa finalizado, parametros não encontrados.");
    Write-Host("");
}

if ($Parametro01 -and $Parametro02){
    Write-Host("Parametros iniciado, parametros encontrados.");
    Write-Host("");

    if ($Parametro01 -eq "Marcos" -and $Parametro02 -eq "123456"){
        Write-Host("Usuario Marcos autenticado.");
        Write-Host("Programa finalizado.");
    }
    else{
        Write-Host("Usuario e/ou senha não são validos.");
        Write-Host("Programa finalizado.");
    }

    Write-Host("");
}