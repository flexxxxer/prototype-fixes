$processOptions = @{
    FilePath = "powershell.exe";
    Verb = "runAs";
    Wait=$true;
    WindowStyle="Hidden";
    ArgumentList = "-Command `"& {Get-PnpDevice -Class 'HIDClass' -Status 'Ok' | Where-Object FriendlyName -Match `"^HID-.*`" | Select-Object -ExpandProperty InstanceId | % { Disable-PnpDevice -InstanceId `$_ -Confirm:`$false }}`""
};
Start-Process @processOptions; # disable hid-devices