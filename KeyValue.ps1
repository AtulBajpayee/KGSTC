# $object = {"a":{"b":{"c":"d"}}}

function KeyValue
{
    $object= Read-Host -Prompt 'Input String'

if ($object -match '":"([^/]+)"')
{
    return $matches[1]
}
}

KeyValue
