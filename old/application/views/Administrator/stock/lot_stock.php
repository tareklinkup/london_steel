<table class="table table-bordered">
		<thead>
		<tr>
		<th>SL</th>
		<th>Product Id</th>
		<th>Product Name</th>
		<th>Category</th>
		<th>Current Quantity</th>
		<th>Stock Value</th>
		</tr>
		</thead>
		<tbody>
		<?php 
		$i = 0;
		$totalStock = 0;
		$totalValue = 0;
		foreach ($current_stock_obj as $key => $value) {$i++;
		?>
		<tr>
		<td><?= $i?></td>
		<td><?= $value->Product_Code?></td>
		<td><?= $value->Product_Name?></td>
		<td><?= $value->ProductCategory_Name?></td>
		<td><?= $value->current_quantity?></td>
		<td><?= $value->PurchaseDetails_TotalAmount?></td>
		</tr>
		<?php
		$totalStock = $totalStock + $value->current_quantity;
		$totalValue = $totalValue + $value->PurchaseDetails_TotalAmount;
		}
		?>
		</tbody>
		<tfoot>
		<tr>
		<td colspan="4" style="text-align:right;">Total Stock Value</td>
		<td><?= $totalStock?></td>
		<td><?= $totalValue?></td>
		</tr>
		</tfoot>
</table>
