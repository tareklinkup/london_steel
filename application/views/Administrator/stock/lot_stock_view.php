<style>
    .v-select {
        margin-bottom: 5px;
    }

    .v-select .dropdown-toggle {
        padding: 0px;
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
</style>
<div id="stock">
	<div class="row">
		<div class="col-xs-12 col-md-12 col-lg-12" style="border-bottom:1px #ccc solid;margin-bottom:5px;">
			<div class="form-group" style="margin-top:10px;">
				<label class="col-sm-1 col-sm-offset-1 control-label no-padding-right"> Select Type </label>
				<div class="col-sm-2">
					<select class="chosen-select" id="search_type">
						<option value="l">Lot Stock</option>
                        <option value="category">Category Wise</option>
					</select>

				</div>
                <div class="col-sm-2" style="display: none;" id="category_wish_s">
                    <select class="chosen-select" id="category_wish" >
                       <?php $categories  =  $this->db->query("SELECT ProductCategory_Name,ProductCategory_SlNo FROM tbl_productcategory ORDER BY ProductCategory_Name")->result_array(); 
                           
                           foreach ($categories as $key => $value) {?>
                               <option value="<?= $value['ProductCategory_SlNo']?>"><?= $value['ProductCategory_Name']?></option>
                      <?php } ?>
                    </select>
                
                </div>
			</div>
	
			<div class="form-group">
				<button class="btn btn-sm btn-success" id="search_stock" style="border-width: 4px;
    font-size: 13px;
    padding: 2px 30px;
    line-height: 1.38;
    margin-bottom: 18px;
">search stock</button>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="table-responsive" id="stockContent">
			     
			</div>
		</div>
	</div>
</div>
<script src="<?php echo base_url();?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url();?>assets/js/vue/vue-select.min.js"></script>

<script type="text/javascript">
	$(document).on('click', '#search_stock',function(){
        var search_type = $('#search_type').chosen().val();
        var category = $('#category_wish').chosen().val();
        $.ajax({
        	url:"<?= base_url()?>/lotstock",
        	method:"POST",
        	data:{search_type:search_type,category:category},
        	success:function(data){
               $('#stockContent').html(data);
        	}
        })
	})
    
    $(document).on('change','#search_type',function(){
        var search_type = $(this).val();
        if (search_type=='category') {
            $('#category_wish_s').css('display','block');
        }else{
            $('#category_wish_s').css('display','none');
        }
    })
</script>