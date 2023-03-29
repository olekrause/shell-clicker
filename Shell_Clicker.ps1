$Time1 = Get-Date

$array = @{
	"shells"    = @{"shell_amount" = 0; "SpS" = 0; "multiplier" = 0.12 }
	"buildings" = @{
		0 = @{"Amount" = 0; "Name" = "System_Bool"; "Price" = 15; "SpS" = 0.1; "current_price" = 15 };
		1 = @{"Amount" = 0; "Name" = "System_Int"; "Price" = 100; "SpS" = 1; "current_price" = 100 };
		2 = @{"Amount" = 0; "Name" = "System_String"; "Price" = 1100; "SpS" = 8; "current_price" = 1100 };
		3 = @{"Amount" = 0; "Name" = "System_Array"; "Price" = 12000; "SpS" = 47; "current_price" = 12000 };
		4 = @{"Amount" = 0; "Name" = "System_Obj"; "Price" = 130000; "SpS" = 260; "current_price" = 130000 };
		5 = @{"Amount" = 0; "Name" = "Skript"; "Price" = 1400000; "SpS" = 1400; "current_price" = 1400000 };
		6 = @{"Amount" = 0; "Name" = "Ordner"; "Price" = 20000000; "SpS" = 7800; "current_price" = 20000000 };
		7 = @{"Amount" = 0; "Name" = "Laufwerk"; "Price" = 330000000; "SpS" = 44000; "current_price" = 330000000 };
		8 = @{"Amount" = 0; "Name" = "Computer"; "Price" = 5100000000; "SpS" = 260000; "current_price" = 5100000000 };
		9 = @{"Amount" = 0; "Name" = "Server"; "Price" = 75000000000; "SpS" = 1600000; "current_price" = 75000000000 }
	}
}


function price_fun {
	for ($i = 0; $i -lt $array['buildings'].Count; $i++) {
		$array.buildings[$i].current_price = (($array.buildings.$i.Amount * $multiply) * $array.buildings.$i.Price) + $array.buildings.$i.Price
	}
}

function SpS_fun {
	$Time2 = Get-Date
	$TimeDiff = New-TimeSpan $Time1 $Time2
	$TimeDiff = $TimeDiff.TotalMilliseconds
	$Time1 = Get-Date
}

function SpS_calc {
	for ($i = 0; $i -lt $array['buildings'].Count; $i++) {
		$SpS = ($array.buildings[$i].Amount * $array.buildings[$i].SpS) + $SpS
	}
	$array.shells.SpS = $SpS
}

function dis_fun {
	SpS_calc
	price_fun
	$dis_SpS = '{0:N}' -f $array.shells.SpS
	$dis_shells = [string]::Format('{0:N0}', $array.shells.shell_amount)
	Clear-Host
	Write-Host "Shells:"$dis_shells
	Write-Host "SpS (Shells pro Sekunde):"$dis_SpS
	Write-Host ""
	for ($i = 0; $i -lt $array['buildings'].Count; $i++) {
		if($i= -eq 0){
			$dis_SpS = '{0:N}' -f $array.buildings[$i].SpS
		}else{
			$dis_amount = [string]::Format('{0:N0}', $array.buildings[$i].Amount)
			
		}
		$dis_amount = [string]::Format('{0:N0}', $array.buildings[$i].Amount)
		$dis_price = [string]::Format('{0:N0}', $array.buildings[$i].current_price)
			Write-Host $array.buildings[$i].Name "($dis_SpS SpS)	-	Preis:	"$dis_price"`nMenge:	"$dis_amount "`n"
	}
}

function main_fun {
	while ($true) {
		dis_fun
		$in = Read-Host "Aktion"
		if ($in -eq '') {
			$array.shells.shell_amount ++
		}
		if ($in -match '\d') {
			$in = [int32]$in
			#if ($shell_amount -ge $array[$in].current_price) {
			$array.buildings.$in.Amount ++
			#	$shell_amount = $shell_amount - $array[$in].current_price
			#}
		}
	}
}

main_fun