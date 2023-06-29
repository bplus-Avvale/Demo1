CLASS ztbai_crear_bo_anotacion DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztbai_crear_bo_anotacion IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA lt_anotaciones_crear TYPE TABLE FOR CREATE ztbai_i_anotacion_u.


    lt_anotaciones_crear = VALUE #( ( IdAnotacion = '0000000002' Gjahr = '2023' Bukrs = 'TBAI'  IdEstado = 'AN' %control = VALUE #(
    IdAnotacion = if_abap_behv=>mk-on
                                                                                                                           Gjahr = if_abap_behv=>mk-on
                                                                                                                           Bukrs = if_abap_behv=>mk-on
                                                                                                                           IdEstado = if_abap_behv=>mk-on
                                                                                                                            ) )

                                   ).




    MODIFY ENTITIES OF ztbai_i_anotacion_u
      ENTITY Anotacion
      CREATE FROM lt_anotaciones_crear
      FAILED DATA(lt_failed)
      REPORTED DATA(lt_reported).



    IF lt_failed IS NOT INITIAL.

      out->write(
        EXPORTING
          data   = lt_failed
          name   = 'Failed'
        RECEIVING
          output = DATA(lt_error)
      ).

    ELSE.

      COMMIT ENTITIES.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
