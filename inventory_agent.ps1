Write-Host "Welcome to the Interactive Inventory Management Agent."
$threshold = 20

while ($true) {
    $stock_input = Read-Host "Warehouse Manager, please enter the current stock level (or type 'exit' to quit)"
    
    if ($stock_input.ToLower() -eq 'exit') {
        Write-Host "Exiting agent. Goodbye!"
        break
    }
    
    $stock_level = 0
    if ([int32]::TryParse($stock_input, [ref]$stock_level)) {
        if ($stock_level -lt $threshold) {
            $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
            Write-Host "[$timestamp] ACTION: Reorder triggered! Stock level ($stock_level) is below the threshold ($threshold)."
        } else {
            $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
            Write-Host "[$timestamp] ACTION: Wait. Stock level ($stock_level) is sufficient."
        }
    } else {
        Write-Host "Invalid input. Please enter a valid integer for the stock level."
    }
}
