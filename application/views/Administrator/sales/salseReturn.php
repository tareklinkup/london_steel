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
    <div class="form-group" style="margin-top:10px;">
      <label class="col-sm-1 col-sm-offset-1 control-label no-padding-right" for="salesInvoiceno"> Invoice no </label>
      <div class="col-sm-2">
        <select class="chosen-select" id="selected_invoice"> 
          <option value="0">Select a Invoice</option>
          <?php $sales_in =  $this->db->query("SELECT SaleMaster_SlNo,SaleMaster_InvoiceNo FROM tbl_salesmaster ORDER BY SaleMaster_InvoiceNo DESC")->result_array();
                     foreach ($sales_in as $key => $value) {
                      echo '<option value="'.$value['SaleMaster_SlNo'].'">'.$value['SaleMaster_InvoiceNo'].'</option>';
                     }
           ?>
        </select>
      </div>
      <div class="col-sm-2">
        <button id="seach_for_returns" class="btn btn-sm btn-primary" style="
    border-width: 4px;
    font-size: 13px;
    padding: 2px 30px;
    line-height: 1.38;
">search</button>
      </div>
    </div>
    <div class="row" id="seach_for_returns_result">
    </div>
  </div>
</div>
<script type="text/javascript">
    $(document).on('click','#seach_for_returns',function(){
          var selected_invoice = $('#selected_invoice').val();
          $.ajax({
            url:"<?= base_url()?>Administrator/Sales/search_returns",
            method:"POST",
            data:{selected_invoice:selected_invoice},
            success:function(data){
               $('#seach_for_returns_result').html(data);
            }
          })
    });


    $(document).on('submit','#salesReturnForm',function(e){
      e.preventDefault();
     
      if ($('#invalid_qty').val()=='1') {
        alert('Invalid Quantity');
        return false;
      }

      $.ajax({
        url:"<?= base_url()?>Administrator/Sales/sales_return_action",
        method:"POST",
        data: new FormData(this),
        contentType:false,
        processData:false,
        success:function(data){
           alert('Return success');
           window.location.reload();
        }
      });
  });

  $(document).on('keyup','.re_qty',function(){ 
      var re_qty = $(this).val();
      var id     = $(this).attr('data-id');
      var re_rate= $('.re_rate_'+id).val();
      var pre_qty = $('.pre_qty_'+id).val(); 
      var qty_h = $('.qty_h_'+id).val();

    

      //  var total_return_amount = parseFloat(re_qty)*parseFloat(re_rate);

      // var return_amount = $('#return_amount').val();
      // var a = $('#return_amount').val(parseFloat(total_return_amount)+parseFloat(return_amount)-total_return_amount);

      if(pre_qty=='') {
        var totalQty = parseFloat(re_qty);
      }else{
        var totalQty = parseFloat(pre_qty)+parseFloat(re_qty);
      }

      if(totalQty>qty_h){
        $(this).val('0')
          $('#invalid_qty').val('1')
        alert('Invalid Quantity');

        return false;
      }else{
          $('#invalid_qty').val('0')
      }
      
      
      var total_rate = parseFloat(re_rate)*parseFloat(re_qty);
      $('.re_amount_'+id).val(total_rate);
      $('.re_amount_show_'+id).text(total_rate);
  });

  
</script>