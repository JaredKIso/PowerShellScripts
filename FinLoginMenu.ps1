Add-Type -AssemblyName System.Windows.Forms

# Create a new form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Popup Menu"
$form.Size = New-Object System.Drawing.Size(325,300)
$form.StartPosition = "CenterScreen"

# Create a label for displaying the clock
$clock = New-Object System.Windows.Forms.Label
$clock.Location = New-Object System.Drawing.Size(10,10)
$clock.Size = New-Object System.Drawing.Size(280,30)
$clock.TextAlign = "MiddleCenter"
$form.Controls.Add($clock)

# Create a timer to update the clock
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 1000
$timer.Add_Tick({
    $clock.Text = (Get-Date).ToString("MM/dd/yyyy hh:mm:ss tt")
})
$timer.Start()

# Create a label for function selection
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Size(10,50)
$label.Size = New-Object System.Drawing.Size(280,30)
$label.Text = "Select two functions to chain:"
$form.Controls.Add($label)

# Create a list of functions
$functions = "Function 1", "Function 2", "Function 3", "Function 4", "Function 5"

# Create two combo boxes for function selection
$comboBox1 = New-Object System.Windows.Forms.ComboBox
$comboBox1.Location = New-Object System.Drawing.Size(10,90)
$comboBox1.Size = New-Object System.Drawing.Size(140,30)
$comboBox1.DropDownStyle = "DropDownList"
$comboBox1.Items.AddRange($functions)
$form.Controls.Add($comboBox1)

$comboBox2 = New-Object System.Windows.Forms.ComboBox
$comboBox2.Location = New-Object System.Drawing.Size(160,90)
$comboBox2.Size = New-Object System.Drawing.Size(140,30)
$comboBox2.DropDownStyle = "DropDownList"
$comboBox2.Items.AddRange($functions)
$form.Controls.Add($comboBox2)

# Create a label for delay input
$delayLabel = New-Object System.Windows.Forms.Label
$delayLabel.Location = New-Object System.Drawing.Size(10, 130)
$delayLabel.Size = New-Object System.Drawing.Size(140, 30)
$delayLabel.Text = "Enter delay (minutes):"
$form.Controls.Add($delayLabel)

# Create a textbox for delay input
$delayTextBox = New-Object System.Windows.Forms.TextBox
$delayTextBox.Location = New-Object System.Drawing.Size(160, 130)
$delayTextBox.Size = New-Object System.Drawing.Size(120, 30)
$form.Controls.Add($delayTextBox)

# Create a label for execution
$executionLabel = New-Object System.Windows.Forms.Label
$executionLabel.Location = New-Object System.Drawing.Size(10, 170)
$executionLabel.Size = New-Object System.Drawing.Size(280, 30)
$executionLabel.Text = "Press the button to execute the selected functions:"
$form.Controls.Add($executionLabel)

# [System.Windows.Forms.MessageBox]::Show("Test 1")
# Create a button for execution
$executionButton = New-Object System.Windows.Forms.Button
$executionButton.Location = New-Object System.Drawing.Size(100, 210)
$executionButton.Size = New-Object System.Drawing.Size(100, 30)
$executionButton.Text = "Execute"
$executionButton.Add_Click({
    # Get the selected functions and delay
    $function1 = $comboBox1.SelectedItem
    $function2 = $comboBox2.SelectedItem
    $delay = $delayTextBox.Text
    if (![int]::TryParse($delay, [ref]$null) -or $delay -eq "" -or $delay -le 0) {
        [System.Windows.Forms.MessageBox]::Show("Please enter a valid delay in minutes.")
        return
    }
    # Check if both functions have been selected
    if ($function1 -eq $null -or $function2 -eq $null) {
        [System.Windows.Forms.MessageBox]::Show("Please select two functions to execute.")
    }
    else {
        # Execute the first function
        switch ($function1) {
            "Function 1" {
                # Insert code here to execute Function 1
                [System.Windows.Forms.MessageBox]::Show("Test 1")
            }
            "Function 2" {
                # Insert code here to execute Function 2
                [System.Windows.Forms.MessageBox]::Show("Test 2")
            }
            "Function 3" {
                # Insert code here to execute Function 3
                [System.Windows.Forms.MessageBox]::Show("Test 3")
            }
            "Function 4" {
                # Insert code here to execute Function 4
                [System.Windows.Forms.MessageBox]::Show("Test 4")
            }
            "Function 5" {
                # Insert code here to execute Function 5
                [System.Windows.Forms.MessageBox]::Show("Test 5")
            }
        }
        Start-Sleep -Seconds (60 * $delay)
        # Execute the second function
        switch ($function2) {
            "Function 1" {
                # Insert code here to execute Function 1
                [System.Windows.Forms.MessageBox]::Show("Test 1")
            }
            "Function 2" {
                # Insert code here to execute Function 2
                [System.Windows.Forms.MessageBox]::Show("Test 2")
            }
            "Function 3" {
                # Insert code here to execute Function 3
                [System.Windows.Forms.MessageBox]::Show("Test 3")
            }
            "Function 4" {
                # Insert code here to execute Function 4
                [System.Windows.Forms.MessageBox]::Show("Test 4")
            }
            "Function 5" {
                # Insert code here to execute Function 5
                [System.Windows.Forms.MessageBox]::Show("Test 5")
            }
        }
    }
})
$form.Controls.Add($executionButton)

# Show the form
$form.ShowDialog() | Out-Null