CLASS ztbai_cl_read_api_invoice DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: constructor, get_invoice_header RETURNING VALUE(rv_json) TYPE string.
  PROTECTED SECTION.

    DATA  mv_endpoint_test TYPE string VALUE 'https://sandbox.api.sap.com/s4hanacloud/sap/opu/odata/sap/ '.
    DATA mv_endpoint_s4 TYPE string VALUE 'https://my404701-api.s4hana.cloud.sap:443/sap/opu/odata/sap/'.

    DATA go_http TYPE REF TO if_web_http_client.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztbai_cl_read_api_invoice IMPLEMENTATION.
  METHOD constructor.

    TRY.
        go_http = cl_web_http_client_manager=>create_by_http_destination( i_destination =  cl_http_destination_provider=>create_by_url( i_url = mv_endpoint_test ) ).
      CATCH cx_web_http_client_error cx_http_dest_provider_error.
        "handle exception
    ENDTRY.


  ENDMETHOD.

  METHOD get_invoice_header.

*  Get Request
    DATA(lo_request) = go_http->get_http_request( ).

* Set Header
    lo_request->set_header_fields( VALUE #(
                                         ( name = 'Content-Type'    value = 'application/json' )
                                         ( name = 'Accept'          value = 'application/json' )
                                         ( name = 'apikey'          value = 'WrqKYlF8rFNYLrNaM1fCl3RCMqFFd1AT' )
*                                         ( name = 'config_authType' value = 'Basic' )
*                                         ( name = 'config_packageName' value = 'SAPS4HANACloud' )


    ) ).

* Set URI
lo_request->set_uri_path( i_uri_path = mv_endpoint_s4 && 'API_SUPPLIERINVOICE_PROCESS_SRV/A_SupplierInvoice?$top=50&$format=json'

).

* Execute
 try.
     rv_json  = go_http->execute( i_method = if_web_http_client=>get )->get_text( ).
   catch cx_web_http_client_error cx_web_message_error.
     "handle exception
 endtry.





  ENDMETHOD.

ENDCLASS.
