$processOptions = @{
    FilePath = "powershell.exe";
    Verb = "runAs";
    Wait=$true;
    WindowStyle="Hidden";
    ArgumentList = "-Command `"& {Get-PnpDevice -Class 'HIDClass' -Status 'Error' | Where-Object FriendlyName -Match `"^HID-.*`" | Select-Object -ExpandProperty InstanceId | % { Enable-PnpDevice -InstanceId `$_ -Confirm:`$false }}`"";
};
Start-Process @processOptions; # enable hid-devices