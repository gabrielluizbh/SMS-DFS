# Script para migração de DFS com Storage Migration Service - Créditos Gabriel Luiz - www.gabrielluiz.com #


# Servidor Orquestrador


# Instalação do Gerenciamento Remoto do DFS e Storage Migration Service.


Install-windowsfeature RSAT-DFS-Mgmt-Con

Install-windowsfeature SMS -IncludeAllSubFeature -IncludeManagementTools


# Para acesso remoto ao servidor utiize o comando abaaixo:


enter-pssession HOSTNAME


# Para reniciar o remoto ao servidor remotamente utiize o comando abaaixo:


restart-computer



# Servidor DFS antigo


# Remover a função de replicação DFS.


remove-windowsfeature FS-DFS-Replication


# Observação: Também pode se utilizar o comando Uninstall-WindowsFeature.



# Servidor DFS novo



# Instalação das funções DFS Replication e Namespace.



Install-windowsfeature FS-DFS-Replication

Install-windowsfeature FS-DFS-Namespace



# Storage Migration Service


# Se caso o Storage Migration Service Proxy não se resistrar execute o comando abaixo no servidor Orquestrador, informando no campo -ComputerName o FQDN do servidor de destino.


Register-SmsProxy -ComputerName DFS1WS2022.gabrielluiz.lan



<#
Referências:

https://learn.microsoft.com/en-us/powershell/module/servermanager/install-windowsfeature?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/enter-pssession?view=powershell-7.2&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/restart-computer?view=powershell-7.2&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/servermanager/uninstall-windowsfeature?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/pt-br/windows-server/storage/storage-migration-service/known-issues?WT.mc_id=5003815

#>