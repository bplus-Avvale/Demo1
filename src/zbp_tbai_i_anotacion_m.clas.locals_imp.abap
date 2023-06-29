CLASS lhc_ZTBAI_I_ANOTACION_M DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Anotacion  RESULT result.
    METHODS setanular FOR MODIFY
      IMPORTING keys FOR ACTION Anotacion~setanular RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Anotacion RESULT result.

ENDCLASS.

CLASS lhc_ZTBAI_I_ANOTACION_M IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD setAnular.

*   Manejador de la accion al pulsar el boton Anular Anotacion

    MODIFY ENTITIES OF ztbai_i_anotacion_m IN LOCAL MODE
    ENTITY Anotacion
    UPDATE
        FIELDS ( IdEstado  )
        WITH VALUE #( FOR key IN keys ( %tky = key-%tky IdEstado = 'AN' ) )
        FAILED failed
        REPORTED reported.

*      Una vez actualizada la entidad, tenemos que leer dicho elemento de la entidad y mapearlo al resultado de la accion ($self)
    READ ENTITIES OF ztbai_i_anotacion_m IN LOCAL MODE
    ENTITY Anotacion
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_anotaciones).


    result = VALUE #( FOR ls_anotaciones IN lt_anotaciones
                        ( %tky = ls_anotaciones-%tky %param = ls_anotaciones )
                    ).




  ENDMETHOD.

  METHOD get_instance_features.

*  Controlamos las features del boton Anular en funcion del valor de la linea seleccionada
    READ ENTITIES OF ztbai_i_anotacion_m IN LOCAL MODE
    ENTITY Anotacion
    FIELDS ( IdEstado ) WITH CORRESPONDING #( keys )
    RESULT DATA(lt_anotacion)
    FAILED failed
    REPORTED reported.

* Para cada anotacion seleccionada revisamos su valor y en funcion de eso cambiamos el estado del boton
    result = VALUE #(
*   El FOR IN se usa para hacer loop a instancias o valores de entidades
    FOR ls_anotacion in lt_anotacion
*    La sentencia LET lo que hace es instanciar un valor de una variable local, en este caso, statusval
*    Una vez asignado su valor, en la parte del IN se usa ese valor calculado.
    let lv_statusval = COND #( WHEN ls_anotacion-IdEstado = 'AN'
                            THEN if_abap_behv=>fc-o-disabled
                            ELSE if_abap_behv=>fc-o-enabled )

                     in ( %tky = ls_anotacion-%tky
                          %action-setAnular = lv_statusval )
).
  ENDMETHOD.

ENDCLASS.
