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
        $.ajax({
        	url:"<?= base_url()?>/lotstock",
        	method:"POST",
        	data:{search_type:search_type},
        	success:function(data){
               $('#stockContent').html(data);
        	}
        })
	})
</script>