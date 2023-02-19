Write-Host "                                                                        " -ForegroundColor Yellow -BackgroundColor DarkCyan
Write-Host "=======================  GetScreen API Powershell  ==================== " -ForegroundColor Yellow -BackgroundColor DarkCyan
Write-Host "                                                                        " -ForegroundColor Yellow -BackgroundColor DarkCyan

# это API ключ. его никому нельзя давать
$apikey = "your_api-key"

# выводим список клиентов, сортируем по имени пользователя
$clients = Invoke-RestMethod https://api.getscreen.ru/v1/agents/list?apikey=$apikey -Method 'GET' 
$clients | where-Object {$_.online -eq 'True'} | Sort-Object os_user | Format-Table -Property group,name,os_user,id

# записываем id в переменую
$id = Read-Host "Enter ID"

# получаем данные с клиента
$client = Invoke-RestMethod "https://api.getscreen.ru/v1/agents/info?apikey=$apikey&agent_id=$id" -Method 'GET'

# подлкючаемся по ссылке onetime_url через браузер по умолчанию
Start-Process $client.data.onetime_url

# удаляем все и перезапускам скрипт
Clear-Host
getscreen.ps1
