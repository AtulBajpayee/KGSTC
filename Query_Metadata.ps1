$NRIP = "169.254.169.254"
$Instance = "/metadata/instance/"
$SingleComponent = "Compute"
#$SingleComponent="/manageddisk/0/storageAccountType"

#Function to pull metadata of an instance
#example :Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -NoProxy -Uri "http://169.254.169.254/metadata/instance?api-version=2020-09-01" 
function Query-InstanceEndpoint
{
    [String]$ApiURI = [String]::Format("http://{0}/{1}?api-version=2021-02-01",$NRIP, $InstanceEndpoint)
    $result = Invoke-RestMethod -Method GET -NoProxy -Uri $uri -Headers @{"Metadata"="True"}
    return $InstanceMetadata
}

#Function to pull data of a single component from isntance or individual datakey 
#Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -NoProxy -Uri "http://169.254.169.254/metadata/instance/compute?api-version=2020-09-01"
function Query-IndividualComponent
{
    [String]$ApiURI = [String]::Format("http://{0}/{1}/{2}?api-version=2021-02-01",$NRIP, $InstanceEndpoint,$SingleComponent)
    $result = Invoke-RestMethod -Method GET -NoProxy -Uri $uri -Headers @{"Metadata"="True"}
    return $SingleComponentData
}


$InstanceMetadata = Query-InstanceEndpoint
$InstanceMetadata | ConvertTo-JSON -Depth 99
write-host $InstanceMetadata

$ComponentData =Query-IndividualComponent
$ComponentData | ConvertTo-JSON -Depth 99
write-host $ComponentData



