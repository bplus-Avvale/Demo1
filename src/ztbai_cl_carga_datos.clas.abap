CLASS ztbai_cl_carga_datos DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .



  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    CLASS-METHODS ejecutar.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztbai_cl_carga_datos IMPLEMENTATION.


  METHOD ejecutar.
    DELETE FROM ztbai_estados.

    DATA wa TYPE ztbai_estados.

    wa = VALUE #( id_estado = 'CR' texto_estado = 'Creada' ).
    INSERT INTO ztbai_estados VALUES @wa.

    wa = VALUE #( id_estado = 'AN' texto_estado = 'Anulada' ).
    INSERT INTO ztbai_estados VALUES @wa.

    wa = VALUE #( id_estado = 'EN' texto_estado = 'Enviada' ).
    INSERT INTO ztbai_estados VALUES @wa.


    wa = VALUE #( id_estado = 'ER' texto_estado = 'Error' ).
    INSERT INTO ztbai_estados VALUES @wa.


    DATA ls_anotacion TYPE ztbai_anot.

    DELETE FROM ztbai_anot.
**    ls_anotacion = VALUE #( mandt = '080' id_anotacion = '0000000001' id_estado = 'CR' tipo_factura = 'DR'  bukrs = 'TBA1'  belnr = '0000000001' buzei = '001'
**                            created_by = 'SAP' gjahr = '2023' ).
**
**    INSERT INTO ztbai_anot VALUES @ls_anotacion.
**
**    ls_anotacion = VALUE #( mandt = '080' id_anotacion = '0000000002' id_estado = 'AN' tipo_factura = 'DR'  bukrs = 'TBA1'  belnr = '0000000002' buzei = '001'
**                            created_by = 'SAP' gjahr = '2023' ).
**
**    INSERT INTO ztbai_anot VALUES @ls_anotacion.
**
**    ls_anotacion = VALUE #( mandt = '080' id_anotacion = '0000000003' id_estado = 'EN' tipo_factura = 'DR'  bukrs = 'TBA1'  belnr = '0000000003' buzei = '001'
**                        created_by = 'SAP' gjahr = '2023' ).
**
**    INSERT INTO ztbai_anot VALUES @ls_anotacion.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    ejecutar(  ).
  ENDMETHOD.

ENDCLASS.
