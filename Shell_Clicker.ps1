$multiply = 0.15

$shell_per_sec = 0
$shell_amount = 0

$array = @{
	0 = @{"Amount" = 0; "Name" = "System_Bool"; "Price" = 15; "SpS" = 0.1; "current_price" = 15 };
	1 = @{"Amount" = 0; "Name" = "System_Int"; "Price" = 100; "SpS" = 1; "current_price" = 100 };
	2 = @{"Amount" = 0; "Name" = "System_String"; "Price" = 1100; "SpS" = 8; "current_price" = 1100 };
	3 = @{"Amount" = 0; "Name" = "System_Array"; "Price" = 12000; "SpS" = 47; "current_price" = 12000 };
	4 = @{"Amount" = 0; "Name" = "System_Obj"; "Price" = 130000; "SpS" = 260; "current_price" = 130000 };
	5 = @{"Amount" = 0; "Name" = "Skript"; "Price" = 1400000; "SpS" = 1400; "current_price" = 1400000 };
	6 = @{"Amount" = 0; "Name" = "Ordner"; "Price" = 20000000; "SpS" = 7800; "current_price" = 20000000 };
	7 = @{"Amount" = 0; "Name" = "Laufwerk"; "Price" = 330000000; "SpS" = 44000; "current_price" = 330000000 };
	8 = @{"Amount" = 0; "Name" = "Computer"; "Price" = 5100000000; "SpS" = 260000; "current_price" = 5100000000 };
	9 = @{"Amount" = 0; "Name" = "Server"; "Price" = 75000000000; "SpS" = 1600000; "current_price" = 75000000000 };
}

function price_fun {
	for ($i = 0; $i -lt $array.Count; $i++) {
		$array[$i].current_price = (($array.$i.Amount * $multiply) * $array.$i.Price) + $array.$i.Price
	}
}


function dis_fun {
	Clear-Host
	Write-Host "Shells:"$shell_amount
	Write-Host "SpS (Shells pro Sekunde):"$shell_per_sec
	Write-Host ""
	for ($i = 0; $i -lt $array.Count; $i++) {
		$dis_SpS = [string]::Format('{0:N0}', $array[$i].SpS)
		$dis_Amount = [string]::Format('{0:N0}', $array[$i].Amount)
		$dis_price = [string]::Format('{0:N0}', $array[$i].current_price)
		if ($i -lt 8) {
			Write-Host $array[$i].Name "("$dis_SpS "SpS) - Menge:		" $dis_Amount "	Preis: "$dis_price
		}
		else {
			Write-Host $array[$i].Name "("$dis_SpS "SpS) - Menge:	" $dis_Amount "	Preis: "$dis_price
		}
	}
}

function main_fun {
	price_fun
	dis_fun
	$in = Read-Host "Aktion"
	if ($in -match '\d') {
		$in = [int32]$in
		$array.$in.Amount ++
	}
	
}

while ($true) {
	main_fun
}