<table class="table table-bordered">
		<thead>
		<tr>
		<th>SL</th>
		<th>Product Id</th>
		<th>Product Name</th>
		<th>Category</th>
		<th>Current Quantity</th>
		<th>Purchase Rate</th>
		<th>Stock Value</th>
		</tr>
		</thead>
		<tbody>
		<?php 
		$i = 0;
		$totalStock = 0;
		$totalValue = 0;
		foreach ($current_stock_obj as $key => $value) {$i++;
		if($value->current_quantity>0.1){
		?>
		<tr>
		<td><?= $i?></td>
		<td><?= $value->Product_Code?></td>
		<td><?= $value->Product_Name?></td>
		<td><?= $value->ProductCategory_Name?></td>
		<td><?= number_format($value->current_quantity,2)?></td>
		<td><?= number_format($value->PurchaseDetails_Rate,2) ?></td>
		<td><?= number_format($value->current_quantity*$value->PurchaseDetails_Rate,2)?></td>
		</tr>
		<?php
		$totalStock = $totalStock + $value->current_quantity;
		$totalValue = $totalValue + ($value->current_quantity*$value->PurchaseDetails_Rate);
		
		}
		}
		?>
		</tbody>
		<tfoot>
		<tr>
		<td colspan="4" style="text-align:right;">Total Stock Value</td>
		
		<td><?= number_format($totalStock,2)?></td>
		<td></td>
		<td><?= number_format($totalValue,2)?></td>
		</tr>
		</tfoot>
</table>
