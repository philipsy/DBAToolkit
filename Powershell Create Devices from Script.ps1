try
{
$fileExtn = ".BAK"
$deviceFiles = Get-ChildItem "{path to your database devices}"
$conn = New-Object System.Data.SqlClient.SqlConnection
$conn.ConnectionString = "{connection string}"
$cmd = New-Object System.Data.SqlClient.SqlCommand
$cmd.connection = $conn
$conn.Open()
ForEach($deviceFilesCur in $deviceFiles)
{
   $commandText = "exec sp_addumpdevice" 
   + " " + "'" + "DISK" + "'" 
   + "," + "'" + $deviceFilesCur.BaseName + "'" 
   + "," + "'" + $deviceFilesCur.FullName + "'"
   $commandText
   $cmd.CommandText = $commandText
   $cmd.ExecuteNonQuery()
}
}
finally
{
  $conn.Close()
}
