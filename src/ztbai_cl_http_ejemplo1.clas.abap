CLASS ztbai_cl_http_ejemplo1 DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztbai_cl_http_ejemplo1 IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA(lt_param) = request->get_form_fields(  ).



    READ TABLE lt_param REFERENCE INTO DATA(lr_param) WITH KEY name = 'entrada'.
    IF sy-subrc = 0.
      CASE lr_param->value.
        WHEN '1'.
          response->set_text( 'Hola que ase' ).
        WHEN 'api'.
          response->set_text( NEW ztbai_cl_read_api_invoice(  )->get_invoice_header(  ) ).
      ENDCASE.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
