$html = "F:\EZEQUIEL\Sistemas Operativos\Trabajo Practico 1 - Escobar, Corno, Pereira, Buzzoni, Rossi\EJ 2\paginas\PáginaWeb.html"

$a = (get-content $html | convertTo-Html > at.html).parsedhtml.title
echo $a
