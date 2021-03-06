﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ConsisTrack.master" AutoEventWireup="true" CodeFile="GPSMasterFrm.aspx.cs" Inherits="Pages_GPSMasterFrm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="../dist/css/dataTables/datatables.min.css" rel="stylesheet" />
    <style>
 
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <input id="hdnID" value="" hidden="hidden" />
    <input id="hdnGPSID" value="" hidden="hidden" />

    <div>
        <div class="col-md-12">
            <div class="card card-secondary card-tabs">
                <div class="card-header p-0 pt-1">
                    <ul class="nav nav-tabs" id="custom-tabs-five-tab" role="tablist">
                        <li class="nav-item ">
                            <a class="nav-link active" id="custom-tabs-five-overlay-dark-tab" data-toggle="pill" href="#custom-tabs-five-overlay-dark" role="tab" aria-controls="custom-tabs-five-overlay-dark" aria-selected="true">GPS List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="custom-tabs-five-normal-tab" data-toggle="pill" href="#custom-tabs-five-normal" role="tab" aria-controls="custom-tabs-five-normal" aria-selected="false">+ Add GPS</a>
                        </li>

                    </ul>
                    <%--              <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                            <i class="fas fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-tool" data-card-widget="maximize">
                            <i class="fas fa-expand"></i>
                        </button>

                    </div>--%>
                </div>

                <div class="card-body">

                    <div class="tab-content" id="custom-tabs-five-tabContent">

                        <div class="tab-pane fade active show" id="custom-tabs-five-overlay-dark" role="tabpanel" aria-labelledby="custom-tabs-five-overlay-dark-tab">
                            <div class="row">
                                <div class="col-lg-12 ">
                                    <div class="float-right">
                                        <div class="form-check form-check-inline badge badge-success">
                                            <input class="form-check-input " type="radio" onchange="GetGPSList('1')" name="inlineRadioOptions" id="inlineRadio1" value="1" checked="checked" />
                                            <label class="form-check-label text-bold" for="inlineRadio1">Active</label>
                                        </div>
                                        <div class="form-check form-check-inline badge badge-danger">
                                            <input class="form-check-input" type="radio" onchange="GetGPSList('0')" name="inlineRadioOptions" id="inlineRadio2" value="0" />
                                            <label class="form-check-label text-bold" for="inlineRadio2">InActive</label>
                                        </div>
                                        <div class="form-check form-check-inline badge badge-info">
                                            <input class="form-check-input" type="radio" onchange="GetGPSList('2')" name="inlineRadioOptions" id="inlineRadio3" value="2" />
                                            <label class="form-check-label text-bold" for="inlineRadio3">All</label>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="overlay-wrapper">
                                <div id="overlay" class="overlay dark">
                                    <i class="fas fa-3x fa-sync-alt fa-spin"></i>
                                    <div class="text-bold pt-2">Loading...</div>
                                </div>
                                <div class="table-responsive">
                                    <table id="tblGpsList" class="table table-striped table-bordered table-hover dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Update</th>
                                                <th>A/D</th>
                                                <th></th>
                                                <th>GPSID</th>
                                                <th>Vendor</th>
                                                <th>DOP</th>
                                                <th>Device Model</th>
                                                <th>ATModel</th>
                                                <th>IMEI No</th>
                                                <th>Status</th>
                                                <th>Remarks</th>
                                                <th>Created By</th>
                                                <th>CreatedDT</th>
                                                <th>UpdatedBy</th>
                                                <th>UpdatedDT</th>
                                                <th>IsActive</th>
                                            </tr>
                                        </thead>

                                        <tfoot>
                                            <tr>
                                                <th>Update</th>

                                                <th>A/D</th>
                                                <th></th>
                                                <th>GPSID</th>
                                                <th>Vendor</th>
                                                <th>DOP</th>
                                                <th>Device Model</th>
                                                <th>ATModel</th>
                                                <th>IMEI No</th>
                                                <th>Status</th>
                                                <th>Remarks</th>
                                                <th>Created By</th>
                                                <th>CreatedDT</th>
                                                <th>UpdatedBy</th>
                                                <th>UpdatedDT</th>
                                                <th>IsActive</th>

                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="custom-tabs-five-normal" role="tabpanel" aria-labelledby="custom-tabs-five-normal-tab">
                            <div class="row">
                                <div class="col-lg-3">
                                    <label class="control-label " for="txtUserCode">
                                        Vendor Name<span class="font-bold" style="color: red">*</span>
                                    </label>
                                    <input class="form-control" id="txtVendorName" placeholder="Vendor Name" type="text" />
                                    <p class="text-muted text-left font-italic"><small>Vendor Name</small></p>
                                </div>
                                <div class=" col-lg-3  ">
                                    <label class="control-label " for="name1">
                                        DOP
                                    </label>
                                    <input class="form-control" id="calDOP" type="date" />
                                    <p class="text-muted text-left font-italic"><small>Enter the Date of Purchase</small></p>
                                </div>
                                <div class=" col-lg-3 ">
                                    <label class="control-label " for="name1">
                                        Device Model
                                    </label>
                                    <input type="text" id="txtDeviceModel" name="txtDeviceModel" class="form-control" placeholder="Device Model" />
                                    <p class="text-muted text-left font-italic"><small>Enter the Device Model</small></p>

                                </div>
                                <div class=" col-lg-3">
                                    <label class="control-label " for="name1">
                                        AT Model
                                    </label>
                                    <input id="txtAtModel" name="txtAtModel" type="text" autocomplete="off" class="form-control" placeholder="At Model" />

                                    <p class="text-muted text-left font-italic"><small>Enter the At Model</small></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3">
                                    <label class="control-label " for="txtUserCode">
                                        IMEI No<span class="font-bold" style="color: red">*</span>
                                    </label>
                                    <input class="form-control" id="txtIMEINo" placeholder="IMEI No" type="text" />
                                    <p class="text-muted text-left font-italic"><small>Enter the IMEI No</small></p>
                                </div>
                                <div class=" col-lg-3  ">
                                    <label class="control-label " for="name1">
                                        Status
                                    </label>
                                    <select id="ddlStatus" class="form-control">
                                        <option value="Status1">Status1</option>
                                        <option value="Status2">Status2</option>
                                        <option value="Status3">Status3</option>
                                        <option value="Status4">Status4</option>
                                    </select>
                                    <p class="text-muted text-left font-italic"><small>Select the Status</small></p>
                                </div>
                                <div class=" col-lg-3 ">
                                    <label class="control-label " for="name1">
                                        Remarks
                                    </label>
                                    <input type="text" class="form-control" id="txtRemarks" placeholder="Remarks" />
                                    <p class="text-muted text-left font-italic"><small>Ener the Remarks</small></p>

                                </div>
                                <div class=" col-lg-3 ">
                                    <%--  <label class="control-label " for="name1">
                                        IsActive
                                    </label>
                                    <select id="ddlIsActive" class="form-control">
                                        <option value="true">Active</option>
                                        <option value="false">InActive</option>
                                    </select>
                                    <p class="text-muted text-left font-italic"><small>Select the Active/InActive</small></p>--%>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-lg-12 m-auto text-right">
                                    <button id="btnSave" type="button" onclick="Save();" class="btn  btn-outline-secondary btn-md"><i class="fas fa-save"></i>Save</button>
                                    <button id="btnReset" type="button" onclick="return Reset();" class="btn  btn-outline-secondary btn-md"><i class="fa fa-skype"></i>Reset</button>
                                    <button id="btnGPSTemplateDownload" type="button" onclick="return Reset();" class="btn  btn-outline-secondary btn-md"><i class="fa fa-download"></i>Sample</button>
                                </div>

                            </div>


                        </div>
                    </div>
                </div>
                <!-- /.card -->
            </div>
        </div>
    </div>


    <!-- jQuery -->
    <script src="../plugins/jquery/jquery-3.5.1.min.js"></script>

    <script src="../plugins/datatables/datatables.min.js"></script>
    <script src="../plugins/datatables/dataTables.bootstrap4.min.js"></script>


    <script>

        $(document).ready(function () {
            GetGPSList('1');
        });
        function Save() {
         
            try {
                var data = {
                    'id':Number($("#hdnID").val()),
                    'gpsId':($("#hdnGPSID").val()),
                    'vender': $("#txtVendorName").val().trim(),
                    'dop': $("#calDOP").val(),
                    'deviceModel': $("#txtDeviceModel").val().trim(),
                    'atModel': $("#txtAtModel").val().trim(),
                    'imeiNo': $("#txtIMEINo").val().trim(),
                    'status': $("#ddlStatus option:selected").val().trim(),
                    // 'isActive': Boolean($("#ddlIsActive option:selected").val().trim()),
                    'isActive':true,
                    'remark': $("#txtRemarks").val().trim(),

                };
           
                data = JSON.stringify(data);
                
                $.ajax({
                    url: "http://localhost:5000/api/GpsMaster/CreateCommand",
                    type: "POST",
                    data: data,
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    async: true,
                    //crossDomain: true,
                    cache: false,
                    success: function (result) {
                        console.log(result);
                        alertmsg("Good Job! ", "Record Save Successfully !!!", "success");
                        GetGPSList('1');
                        Reset();
                    },
                    error: function (request, status, error) {
                        
                        console.log(error);
                        var errors = ''; 
                          
                        for(datos in request.responseJSON.errors)
                        {
                            errors +='<span class=text-danger>'+request.responseJSON.errors[datos]+'</span>'+'</br>'; 
                        }
                        alertmsg('Validation Error','', "warning",errors);

                    }

                });
    
            } catch (err) {
                alertmsg('', err.message, "error",'');
            }
            


        }

        function Reset() {
            $("#txtVendorName").val('');
            $("#calDOP").val('');
            $("#txtDeviceModel").val('');
            $("#txtATModel").val('');
            $("#txtIMEINo").val('');
            $("#ddlStatus").val('');
            $("#ddlIsActive").val('');
            $("#txtRemarks").val('');
            $("#txtAtModel").val('');

        }



        function GetGPSList(sel) {
           // document.getElementById('inlineRadio1').checked='checked';   
            LoadingOn();
            $.ajax({
                type: "GET",
                url: "http://localhost:5000/api/GpsMaster",
                data: {"flag":sel},
                dataType: "json",
                async: true,
                crossDomain: true,
                cache: false,
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    LoadingOff();
                    var table = $('#tblGpsList').dataTable({
                        order: [[2, 'desc']],
                        bDestroy: true,
                        data: (data),
                        pageLength: 10,
                        "autoWidth": false,
                        "iDisplayLength": 10,
                        responsive: true,
                        "processing": true,
                        "deferLoading": 57,
                        aoColumns: [
                             {
                                 'data': 'isActive', "render": function (data) {
                                    
                                     if(data ===true)
                                     { return '<button id="btnUpdate"   type="button"  title="Click for Update"  class="badge badge-success">Update<i class="fa fa-right "></i></button>';}
                                     else
                                     {
                                         return null;
                                     }
                                    
                                 },
                             },
                              {
                                  'data': 'isActive', "render": function (data) {
                                      if(data===true)
                                          return '<button id="btnAD"  value="false"   type="button"  title="Click for Delete"  class="badge badge-danger"><i class="fa fa-trash"></i> Delete</button>';
                                      else
                                          return '<button id="btnAD" value="true"     type="button"  title="Click for Activate"  class="badge badge-success"><i class="fa fa-check"> Active</i></button>';
                                  },
                              },
                         { 'data': 'id', "autoWidth": true, "visible": false },
                         { 'data': 'gpsId', "autoWidth": true, "visible": true },
                         { 'data': 'vender', "autoWidth": true },
                         { 'data': 'dop', "autoWidth": true },
                         { 'data': 'deviceModel', "autoWidth": true },
                         { 'data': 'atModel', "autoWidth": true },
                         { 'data': 'imeiNo', "autoWidth": true },
                         { 'data': 'status', "autoWidth": true },
                         { 'data': 'remark', "autoWidth": true },
                         { 'data': 'createdBy', "autoWidth": true },
                         { 'data': 'createdDT', "autoWidth": true },
                         { 'data': 'updatedBy', "autoWidth": true },
                         { 'data': 'updatedDT', "autoWidth": true },
                         { 'data': 'isActive', "autoWidth": true },
                        ],
                        dom: '<"html5buttons"B>lTfgitp',
                        buttons: [
                            { extend: 'copy', columns: [1, 2, 3, 4, 5, 6], exportOptions: { columns: [ 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,14,15] } },
                            { extend: 'csv', title: 'GPS List', exportOptions: { columns: [ 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,14,15] } },
                            { extend: 'excel', title: 'GPS List', exportOptions: { columns: [ 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,14,15] } },
                            { extend: 'pdf', title: 'GPS List', exportOptions: { columns: [ 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,14,15] } },

                            {
                                extend: 'print', exportOptions: { columns: [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,14,15] },
                                customize: function (win) {
                                    $(win.document.body).addClass('white-bg');
                                    $(win.document.body).css('font-size', '10px');

                                    $(win.document.body).find('table')
                                            .addClass('compact')
                                            .css('font-size', 'inherit');
                                }
                            }
                        ],
                        //"fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                        //    //if (aData["Status"] == "Completed") {
                        //    //    $('td', nRow).css('background-color', '#18a68940');
                        //    //    $('#btnVerify', nRow).hide();
                        //    //}
                        //    //if (aData["Status"] == "Assigned") {
                        //    //    $('td', nRow).css('background-color', '#FFA500');
                        //    //    $('#btnVerify', nRow).hide();
                        //    //}
                        //},

                    });

                    //Edit button Functionality in the DataTable
                    $('#tblGpsList tbody').on('click', '#btnUpdate', function () {
                        var table = $('#tblGpsList').DataTable();
                        var data = table.row($(this).parents('tr')).data();
                        // alert(data.dop);
                        document.getElementById("btnSave").value = 'Update';
                        //document.getElementById("btnSave").textContent = 'Update';
                        document.getElementById("hdnID").value = data["id"];
                        document.getElementById("hdnGPSID").value = data["gpsId"];

                        document.getElementById("txtVendorName").value = data["vender"];
                        if (data["dop"] != null && data["dop"] != "") {
                            document.getElementById("calDOP").value = data["dop"].split('T')[0]
                        }
                        else {
                            document.getElementById("calDOP").value = "";
                        }
                        // document.getElementById("calDOP").value = data["dop"];
                        document.getElementById("txtDeviceModel").value = data["deviceModel"];
                        document.getElementById("txtAtModel").value = data["atModel"];
                        document.getElementById("txtIMEINo").value = data["imeiNo"];
                        document.getElementById("ddlStatus").value = data["status"];
                        document.getElementById("txtRemarks").value = data["remark"];
                        //document.getElementById("ddlIsActive").value = data["isActive"];
                        // Select tab by name
                        $('.nav-tabs a[href="#custom-tabs-five-normal"]').tab('show');
                       
                    });
                    $('#tblGpsList tbody').on('click', '#btnAD', function () {
                        $(".nav-tabs a").click(function(){
                            $(this).tab('show');
                        });
                        var table = $('#tblGpsList').DataTable();
                        var data = table.row($(this).parents('tr')).data();
                        
                        if(data["isActive"]=== true)
                        {
                            Swal.fire({
                                title: 'Are you sure?',
                                text: "You won't be able to revert this!",
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Yes, delete it!'
                            }).then((result) => {
                                if (result.value) {
                      $.ajax({
                                type: "DELETE",
                            url: "http://localhost:5000/api/GpsMaster/"+data.id+"/"+$("#btnAD").val(),
                            // data: {"Id":data.id},
                            dataType: "json",
                            async: true,
                            crossDomain: true,
                            cache: false,
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                GetGPSList('1');
                                Swal.fire('Deleted!','Your file has been deleted.','success')
                                return;
                            }
                        });

                               
                    }

                    });
        }
        else
        {
                $.ajax({
                    type: "DELETE",
                    url: "http://localhost:5000/api/GpsMaster/"+data.id+"/"+$("#btnAD").val(),
                    dataType: "json",
                    async: true,
                    // crossDomain: true,
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        GetGPSList('0');
                        swal.fire({
                            title: 'Activated',
                            text: '',
                            icon: 'success',
                            html:'<span class="text-success"><h4>Record is Activated Successfull !!</h4></span>',
                        });
                        return 0;
                    }
                
                })
                      
        }
                       
                       
        });


        },
        error: function (xhr, ajaxOptions, thrownError)
        { alert(xhr.responseText); }
        });
        }

      
    </script>
</asp:Content>

