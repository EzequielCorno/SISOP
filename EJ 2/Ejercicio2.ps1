$prepo = 'a','ante','bajo','cabe','con','contra','de','desde','durante','en','entre','hacia','hasta','mediante','para','por','sin','so','sobre','tras','versus','vía'
$URI = “http://www.sisop.com.ar/“
$HTML = Invoke-WebRequest -Uri $URI
#[HTMLFile] $html = Get-Content -Path "C:\Users\Ariel\OneDrive\Documentos\mipagina.html"

$palabras = $HTML.ParsedHtml.title.Split(' ')
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
