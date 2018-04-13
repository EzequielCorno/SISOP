cls
$prepo = 'a','ante','bajo','cabe','con','contra','de','desde','durante','en','entre','hacia','hasta','mediante','para','por','sin','so','sobre','tras','versus','vía'
<#$URI = “http://www.sisop.com.ar/“
$HTML = Invoke-WebRequest -Uri $URI
#>

cd "F:\EZEQUIEL\Sistemas Operativos\Trabajo Practico 1 - Escobar, Corno, Pereira, Buzzoni, Rossi\Powershell\EJ 2\paginas"
$html = Get-Content pagina1.html -Raw
$doc = New-Object -com "HTMLFILE"
$doc.IHTMLDocument2_write($html)


$palabras = $doc.title.Split(' ')
echo $palabras.count
$CantPag = 0
$cantpal = @{}
#While(paginas)
$i = 0
while($i -lt $palabras.count){
    if(!$prepo.Contains($palabras[$i])){
        #si esta sumar
        if($cantpal.ContainsKey($palabras[$i])){
            $cantpal[$palabras[$i]]+=1
        }else{
            #Si no está, agregar
            $cantpal.add($palabras[$i], 1)
        }
    }
    $i++
}
echo "Páginas Analizadas:` $CantPag"
echo 'Resultados Obtenidos:'
echo $cantpal | Sort-Object -Property value -Descending
