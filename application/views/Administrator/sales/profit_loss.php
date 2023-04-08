<style>
	.v-select {
		margin-bottom: 5px;
		float: right;
		min-width: 200px;
	}

	.v-select .dropdown-toggle {
		padding: 0px;
		height: 25px;
	}

	.v-select input[type=search],
	.v-select input[type=search]:focus {
		margin: 0px;
	}

	.v-select .vs__selected-options {
		overflow: hidden;
		flex-wrap: nowrap;
	}

	.v-select .selected-tag {
		margin: 2px 0px;
		white-space: nowrap;
		position: absolute;
		left: 0px;
	}

	.v-select .vs__actions {
		margin-top: -5px;
	}

	.v-select .dropdown-menu {
		width: auto;
		overflow-y: auto;
	}

	#table1 {
		border-collapse: collapse;
		width: 100%;
	}

	#table1 td,
	#table1 th {
		padding: 5px;
		border: 1px solid #909090;
	}

	#table1 th {
		text-align: center;
	}

	#table1 thead {
		background-color: #cbd6e7;
	}
</style>
<div id="profitLoss">
	<div class="row" style="border-bottom: 1px solid #ccc;">
		<div class="col-md-12">
			<form class="form-inline" v-on:submit.prevent="getProfitLoss">

				<!-- <div class="form-group">
					<label>Search Type</label>
					<select class="form-control" v-model="searchType" @change="onChangeSearchType" style="padding: 1px;border-radius:4px">
						<option value="">Select</option>
						<option value="customer">By Customer</option>
						<option value="product">By Product</option>
					</select>
				</div> -->

				<div class="form-group" style="margin-right: 15px;">
					<label>Customer &nbsp;</label>
					<v-select v-bind:options="customers" v-model="selectedCustomer" label="display_name"></v-select>
				</div>

				<!-- <div class="form-group" style="margin-right: 15px;display:none" :style="{display:searchType == 'product' ? '' : 'none'}">
					<label>Product &nbsp;</label>
					<v-select v-bind:options="products" v-model="selectedProduct" label="display_text"></v-select>
				</div> -->

				<div class="form-group">
					<label>Date from </label>
					<input type="date" class="form-control" v-model="filter.dateFrom">
				</div>

				<div class="form-group">
					<label>to </label>
					<input type="date" class="form-control" v-model="filter.dateTo">
				</div>

				<div class="form-group">
					<input type="submit" class="btn btn-info btn-xs" value="Search" style="padding-top:0px;padding-bottom:0px;margin-top:-4px;">
				</div>
			</form>
		</div>
	</div>

	<div class="row" style="padding: 10px 0;display:none;" v-bind:style="{display: reportData.length > 0 ? '' : 'none'}">
		<div class="col-md-12">
			<a href="" @click.prevent="print"><i class="fa fa-print"></i> Print</a>
		</div>
	</div>

	<div class="row" style="margin-top: 10px;">
		<div class="col-md-12">
			<div class="table-responsive" id="reportTable">
				<table id="table1">
					<thead>
						<tr>
							<th>Product Id</th>
							<th>Product</th>
							<th>Sold Quantity</th>
							<th>Purchase Rate</th>
							<th>Purchased Total</th>
							<th>Sale Rate</th>
							<th>Sold Amount</th>
							<th>Profit/Loss</th>
						</tr>
					</thead>

					<tbody v-for="data in reportData" style="display:none;" v-bind:style="{display: reportData.length > 0 ? '' : 'none'}">
						<tr>
							<td colspan="8" style="background-color: #e3eae7;">
								<strong>Invoice: </strong> {{ data.SaleMaster_InvoiceNo }} |
								<strong>Sales Date: </strong> {{ data.SaleMaster_SaleDate }} |
								<strong>Customer: </strong> {{ data.Customer_Name }} |
								<strong>Discount: </strong> {{ data.SaleMaster_TotalDiscountAmount }}
							</td>
						</tr>
						<tr v-for="product in data.saleDetails">
							<td>{{ product.Product_Code }}</td>
							<td>{{ product.Product_Name }}</td>
							<td style="text-align:right;">{{ parseFloat(product.SaleDetails_TotalQuantity,2).toFixed(2) }}</td>
							<td style="text-align:right;">{{ product.PurchaseDetails_Rate }}</td>
							<td style="text-align:right;">{{ parseFloat(product.PurchaseDetails_Rate*product.SaleDetails_TotalQuantity).toFixed(2) }}</td>

							<td style="text-align:right;">{{ parseFloat(product.SaleDetails_Rate).toFixed(2) }}</td>
							<td style="text-align:right;">{{ parseFloat(product.SaleDetails_Rate*product.SaleDetails_TotalQuantity).toFixed(2) }}</td>
							<td style="text-align:right;">{{ parseFloat((product.SaleDetails_Rate*product.SaleDetails_TotalQuantity)-(product.PurchaseDetails_Rate*product.SaleDetails_TotalQuantity)).toFixed(2) }}</td>
						</tr>
						<tr style="background-color: #f0f0f0;font-weight: bold;">
							<td colspan="5" style="text-align:right;">Total</td>
							<td style="text-align:right;"><!--{{  data.saleDetails.reduce((prev, cur) => { return prev + parseFloat(cur.purchased_amount).toFixed(2) }, 0) }} --></td>
							<td style="text-align:right;"><!-- {{ data.saleDetails.reduce((prev, cur) => { return prev + parseFloat(cur.SaleDetails_TotalAmount).toFixed(2) }, 0) }} --></td>
							<td style="text-align:right;">{{ data.saleDetails.reduce((prev, cur) => { 
								return prev + parseFloat((cur.SaleDetails_Rate*cur.SaleDetails_TotalQuantity)-(cur.PurchaseDetails_Rate*cur.SaleDetails_TotalQuantity))
							}, 0).toFixed(2) }}</td>
						</tr>

					</tbody>
					<tfoot style="display:none;font-weight:bold;background-color:#e9dcdc;" v-bind:style="{display: reportData.length > 0 ? '' : 'none'}">
						<!-- 	<tr>
							<td style="text-align:right;" colspan="5">Total Profit : </td>
							<td style="text-align:right;">
								{{ 
									reportData.reduce((prev, cur) => { return prev + parseFloat(
										cur.saleDetails.reduce((p, c) => { return p + parseFloat(c.purchased_amount) }, 0)
									)}, 0).toFixed(2)
								}}
							</td>
							<td style="text-align:right;">
								{{ 
									reportData.reduce((prev, cur) => { return prev + parseFloat(
										cur.saleDetails.reduce((p, c) => { return p + parseFloat(c.SaleDetails_TotalAmount) }, 0)
									)}, 0).toFixed(2)
								}}
							</td>
							<td style="text-align:right;">
								{{ 
									totalProfit = reportData.reduce((prev, cur) => { return prev + parseFloat(
										cur.saleDetails.reduce((p, c) => { return p + parseFloat(c.profit_loss) }, 0)
									)}, 0).toFixed(2)
								}}
							</td>
						</tr> -->


						<tr>
							<td colspan="5" style="text-align:right;">Total Profit </td>
							<td colspan="2"></td>
							<td style="text-align:right;">{{ salesProfit }}</td>
						</tr>

						<tr>
							<td colspan="5" style="text-align:right;">Other Income (+)</td>
							<td colspan="2"></td>
							<td style="text-align:right;">{{ otherIncomeExpense.income }}</td>
						</tr>
						<tr>
							<td colspan="5" style="text-align:right;">Commission (+)</td>
							<td colspan="2"></td>
							<td style="text-align:right;">{{ otherIncomeExpense.commission }}</td>
						</tr>

						<tr>
							<td colspan="5" style="text-align:right;">Total Discount (-)</td>
							<td colspan="2"></td>
							<td style="text-align:right;">{{ totalDiscount = reportData.reduce((prev, cur) => { return prev + parseFloat(cur.SaleMaster_TotalDiscountAmount) }, 0).toFixed(2) }}</td>
						</tr>
						<tr>
							<td colspan="5" style="text-align:right;">Cash Transaction (-)</td>
							<td colspan="2"></td>
							<td style="text-align:right;">{{ otherIncomeExpense.expense }}</td>
						</tr>

						<tr>
							<td colspan="5" style="text-align:right;">Employee Payment (-)</td>
							<td colspan="2"></td>
							<td style="text-align:right;">{{ otherIncomeExpense.employee_payment }}</td>
						</tr>

						<tr>
							<td colspan="5" style="text-align:right;">Purchase Transport Cost (-)</td>
							<td colspan="2"></td>
							<td style="text-align:right;">{{ otherIncomeExpense.purchaseTransportCost }}</td>
						</tr>

						<tr>
							<td colspan="5" style="text-align:right;">Net Profit : </td>
							<td colspan="2"></td>
							<td style="text-align:right;">{{ netProfit }}</td>
						</tr>


						<!-- 	<tr>
							<td colspan="4" style="text-align:right;">Profit</td>
							<td colspan="2"></td>
							<td style="text-align:right;"> -->
						<!-- {{  ((parseFloat(totalProfit) + parseFloat(otherIncomeExpense.income)) - 
									(parseFloat(totalDiscount) + parseFloat(otherIncomeExpense.expense) + parseFloat(otherIncomeExpense.employee_payment))).toFixed(2) }} -->


						<!-- 
									{{ 
									reportData.reduce((prev, cur) => {


									
									 return prev + parseFloat(
										cur.saleDetails.reduce((p, c) => { 
										
										totalProfit = parseFloat((c.SaleDetails_Rate*c.SaleDetails_TotalQuantity)-(c.Purchase_Rate*c.SaleDetails_TotalQuantity)).toFixed(2);

										console.log(parseFloat(p)+parseFloat(totalProfit))

										let a = parseFloat(p)+parseFloat(totalProfit);

										return a;

									}, 0)
									)
								}, 0).toFixed(2)
								}} -->
						<!-- </td>
						</tr> -->

					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>

<script src="<?php echo base_url(); ?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vue-select.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>

<script>
	Vue.component('v-select', VueSelect.VueSelect);
	new Vue({
		el: '#profitLoss',
		data() {
			return {
				filter: {
					customer: '',
					// product: '',
					dateFrom: moment().format('YYYY-MM-DD'),
					dateTo: moment().format('YYYY-MM-DD')
				},
				searchType: '',
				customers: [],
				selectedCustomer: {
					Customer_SlNo: '',
					display_name: 'Select'
				},
				reportData: [],
				otherIncomeExpense: {
					income: 0,
					expense: 0,
					employee_payment: 0,
					commission: 0,
					purchaseTransportCost: 0,
				},
				products: [],
				selectedProduct: {
					Product_SlNo: '',
					display_text: 'Select',
				},
			}
		},
		created() {
			this.getCustomers();
			// this.getProducts();
		},
		computed: {
			totalDiscount() {
				return this.reportData.reduce((prev, cur) => {
					return prev + parseFloat(cur.SaleMaster_TotalDiscountAmount)
				}, 0).toFixed(2);

			},
			salesProfit() {
				return (this.reportData.reduce((prev, curr) => {
					return +prev + +curr.saleDetails.reduce((p, c) => {
						return +p + +(parseFloat(c.SaleDetails_Rate * c.SaleDetails_TotalQuantity) - parseFloat(c.PurchaseDetails_Rate * c.SaleDetails_TotalQuantity)).toFixed(2)
					}, 0);
				}, 0)).toFixed(2)
			},
			netProfit() {
				return parseFloat(this.salesProfit) - (parseFloat(this.otherIncomeExpense.employee_payment) + parseFloat(this.otherIncomeExpense.expense) + parseFloat(this.totalDiscount) + parseFloat(this.otherIncomeExpense.purchaseTransportCost)) + parseFloat(this.otherIncomeExpense.income) + parseFloat(this.otherIncomeExpense.commission)


				// this.reportData.reduce((prev, cur) => {
				// 	return +prev + parseFloat(cur.saleDetails.reduce((p, c) => {
				// 		return +p + parseFloat((c.SaleDetails_Rate * c.SaleDetails_TotalQuantity) - (c.Purchase_Rate * c.SaleDetails_TotalQuantity)).toFixed(2)
				// 	}, 0))

				// 	// let a = parseFloat(p) + parseFloat(totalProfit);
				// 	// return a;
				// 	// }, 0))
				// }, 0).toFixed(2) - (parseFloat(this.otherIncomeExpense.employee_payment) + parseFloat(this.otherIncomeExpense.expense) + parseFloat(this.totalDiscount)) + parseFloat(this.otherIncomeExpense.income)
			}
		},
		methods: {
			onChangeSearchType() {
				this.reportData = [];
				if (this.searchType != 'customer') {
					this.selectedCustomer = {
						Customer_SlNo: '',
						display_name: 'Select'
					}
				}
				if (this.searchType != 'product') {
					this.selectedProduct = {
						Product_SlNo: '',
						display_text: 'Select',
					};
				}
			},
			getCustomers() {
				axios.get('/get_customers').then(res => {
					this.customers = res.data;
				})
			},
			// getProducts() {
			// 	axios.get('/get_products').then(res => {
			// 		this.products = res.data;
			// 	})
			// },
			totalProfit() {

				this.reportData.reduce((prev, cur) => {
					return prev + parseFloat(
						cur.saleDetails.reduce((p, c) => {
							totalProfit = parseFloat((c.SaleDetails_Rate * c.SaleDetails_TotalQuantity) - (c.Purchase_Rate * c.SaleDetails_TotalQuantity)).toFixed(2);
							let a = parseFloat(p) + parseFloat(totalProfit);
							return a;
						}, 0)
					)
				}, 0).toFixed(2)
			},
			// totalDiscount() {
			// 	let d = this.reportData.reduce((prev, cur) => {
			// 		return prev + parseFloat(cur.SaleMaster_TotalDiscountAmount)
			// 	}, 0).toFixed(2);

			// },
			async getProfitLoss() {
				// if (this.searchType == '') {
				// 	alert('Select a search type');
				// 	return
				// }
				// if (this.searchType == 'product' && this.selectedProduct.Product_SlNo == '') {
				// 	alert('Select a Product');
				// 	return
				// }

				this.filter.customer = this.selectedCustomer.Customer_SlNo;
				// this.filter.product = this.selectedProduct.Product_SlNo;

				// if (this.selectedCustomer != null) {
				// } else {
				// 	this.filter.customer = null;
				// }
				this.reportData = await axios.post('/get_profit_loss', this.filter).then(res => {
					if (this.searchType == 'product') {
						return res.data.filter(p => p.saleDetails.length > 0);
					} else {
						return res.data;
					}
				})

				this.otherIncomeExpense = await axios.post('/get_other_income_expense', this.filter).then(res => {
					return res.data;
				})

			},

			async print() {
				let customerText = '';
				if (this.selectedCustomer.Customer_SlNo != '') {
					customerText = `
						<strong>Customer Id: </strong> ${this.selectedCustomer.Customer_Code}<br>
						<strong>Name: </strong> ${this.selectedCustomer.Customer_Name}<br>
						<strong>Address: </strong> ${this.selectedCustomer.Customer_Address}<br>
						<strong>Mobile: </strong> ${this.selectedCustomer.Customer_Mobile}
					`;
				}

				let dateText = '';
				if (this.filter.dateFrom != '' && this.filter.dateTo != '') {
					dateText = `
						Statement from <strong>${this.filter.dateFrom}</strong> to <strong>${this.filter.dateTo}</strong>
					`;
				}
				let reportContent = `
					<div class="container">
						<h4 style="text-align:center">Profit/Loss Report</h4 style="text-align:center">
						<div class="row">
							<div class="col-md-6">${customerText}</div>
							<div class="col-md-6 text-right">${dateText}</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								${document.querySelector('#reportTable').innerHTML}
							</div>
						</div>
					</div>
				`;

				var mywindow = window.open('', 'PRINT', `width=${screen.width}, height=${screen.height}`);
				mywindow.document.write(`
					<?php $this->load->view('Administrator/reports/reportHeader.php'); ?>
				`);

				mywindow.document.head.innerHTML += `
					<style>
						#table1{
							border-collapse: collapse;
							width: 100%;
						}

						#table1 td, #table1 th{
							padding: 5px;
							border: 1px solid #909090;
						}

						#table1 th{
							text-align: center;
						}

						#table1 thead{
							background-color: #cbd6e7;
						}
					</style>
				`;
				mywindow.document.body.innerHTML += reportContent;

				mywindow.focus();
				await new Promise(resolve => setTimeout(resolve, 1000));
				mywindow.print();
				mywindow.close();
			}
		}
	})
</script>