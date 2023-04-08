<style>
	.v-select{
		margin-bottom: 5px;
	}
	.v-select .dropdown-toggle{
		padding: 0px;
	}
	.v-select input[type=search], .v-select input[type=search]:focus{
		margin: 0px;
	}
	.v-select .selected-tag{
		margin: 0px;
	}
</style>
<div class="row" id="salesReturn">
	<div class="col-xs-12 col-md-12 col-lg-12" style="border-bottom:1px #ccc solid;">
		<div class="table-responsive">
			<form id="salesReturnForm">
		<table class="table table-bordered">
			<tr>
				<th>SL</th>
				<th>Product</th>
				<th>Quantity</th>
				<th>Amount</th>
				<th>Already Return Quantity</th>
				<th>Already Return Amount</th>
				<th>Return Quantity</th>
				<th>Return Rate</th>
				<th>Return Amount</th>
			</tr>
			
				<?php
				$get_sm_invoice = $this->db->query("SELECT SaleMaster_InvoiceNo FROM tbl_salesmaster WHERE SaleMaster_SlNo='$selected_invoice'")->result_array();
				$sm_invoice = $get_sm_invoice[0]['SaleMaster_InvoiceNo'];
				$return_results = $this->db->query("SELECT * FROM tbl_saledetails WHERE SaleMaster_IDNo='$selected_invoice' ")->result_array();
				foreach ($return_results as $key => $value) {
				$Product_IDNo = $value['Product_IDNo'];
                $prod_info = $this->db->query("SELECT Product_Name FROM tbl_product WHERE Product_SlNo='$Product_IDNo'")->result_array();

                // 
                $SaleReturn_SlNoGet = $this->db->query("SELECT SaleReturn_SlNo FROM tbl_salereturn WHERE SaleMaster_InvoiceNo='$sm_invoice'")->result_array();
                $SaleReturn_SlNo = $SaleReturn_SlNoGet[0]['SaleReturn_SlNo'];
                $purchase_d_id = $value['purchase_d_id'];
                $pre_re_info = $this->db->query("SELECT * FROM tbl_salereturndetails WHERE SaleReturn_IdNo='$SaleReturn_SlNo' AND SaleReturnDetailsProduct_SlNo='$Product_IDNo' AND purchase_d_id='$purchase_d_id'")->result_array();
				?>
				<tr>
				<td>1</td>
				<td><?= $prod_info[0]['Product_Name']?></td>
				<td><?= $value['SaleDetails_TotalQuantity']?></td>

				<input type="hidden" name="qty_h_<?= $value['SaleDetails_SlNo']?>" id="qty_h" data-id="<?= $value['SaleDetails_SlNo']?>" class="qty_h_<?= $value['SaleDetails_SlNo']?>" value="<?= $value['SaleDetails_TotalQuantity']?>">

				<td><?= $value['SaleDetails_TotalAmount']?></td>

				<td><?= $pre_re_info[0]['SaleReturnDetails_ReturnQuantity']?></td>

				<input type="hidden" name="pre_qty_<?= $value['SaleDetails_SlNo']?>" id="pre_qty_<?=$value['SaleDetails_SlNo']?>" class="pre_qty_<?=$value['SaleDetails_SlNo']?>" value="<?= $pre_re_info[0]['SaleReturnDetails_ReturnQuantity']; ?>">

				<td><?= $pre_re_info[0]['SaleReturnDetails_ReturnAmount']?></td>
				<td><input type="text" name="re_qty_<?= $value['SaleDetails_SlNo']?>" id="re_qty" data-id="<?= $value['SaleDetails_SlNo']?>" class="re_qty_<?= $value['SaleDetails_SlNo']?> re_qty" value="0" autocomplete="off" ></td>

				<td><input type="text" name="re_rate_<?= $value['SaleDetails_SlNo']?>" id="re_rate" class="re_rate_<?= $value['SaleDetails_SlNo']?>" data-id="<?= $value['SaleDetails_SlNo']?>" value="<?= $value['SaleDetails_Rate']?>" autocomplete="off"></td>
				<td id="re_amount_show" class="re_amount_show_<?= $value['SaleDetails_SlNo']?>"></td>
				<input type="hidden" name="re_amount_<?= $value['SaleDetails_SlNo']?>" id="re_amount_<?= $value['SaleDetails_SlNo']?>" data-id="<?= $value['SaleDetails_SlNo']?>"  class="re_amount_<?= $value['SaleDetails_SlNo']?>" value="<?= $value['SaleDetails_SlNo']?>" autocomplete="off">
				<input type="hidden" name="Product_IDNo_<?= $value['SaleDetails_SlNo']?>" value="<?= $value['Product_IDNo']?>">
				<input type="hidden" name="purchase_d_id_<?= $value['SaleDetails_SlNo']?>"  value="<?= $value['purchase_d_id']?>">

				
				<input type="hidden" name="id_<?= $value['SaleDetails_SlNo']?>"  value="<?= $value['SaleDetails_SlNo']?>">
			    </tr>
				<?php } ?>
				<tr>

				</tr>
			
		</table>
		<input type="hidden" name="return_amount" id="return_amount"  value="0" readonly="">
		<input type="hidden" name="invoice"  value="<?= $selected_invoice?>">
		<input type="hidden" name="invalid_qty" id="invalid_qty" value="0">
		<input type="submit" class="btn btn-sm btn-success" value="return"  name="" style="margin-left: 50%;
    margin-bottom: 15px;">
		</form>
	</div>
	</div>
	</div>
</div>
<script type="text/javascript">

	
	
</script>
<script src="<?php echo base_url();?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/vue-select.min.js"></script>
<script src="<?php echo base_url();?>assets/js/moment.min.js"></script>