@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entidad anotacion Managed'
@Metadata.allowExtensions: true
//Este ejemplo de BO es para una ROOT de anotacion de TBAI
// Es un ejemplo basico sin composicion con entidad hijo
define root view entity ZTBAI_I_ANOTACION_M
  as select from ztbai_anot

  //Valores por Dato maestro
  association [1..1] to ztbai_vm_estados as _estados_text on $projection.IdEstado = _estados_text.IdEstado
  //Valores por dominio para ayuda de busqueda
    association to ZTBAI_VH_ESTADOS as _estados_vh on $projection.IdEstado = _estados_vh.Value
{

  key uuid as uuid,
     id_anotacion          as IdAnotacion,

      id_estado             as IdEstado,
      tipo_factura          as TipoFactura,
      bukrs                 as Bukrs,
      belnr                 as Belnr,
      gjahr                 as Gjahr,
      buzei                 as Buzei,
      id_lote               as IdLote,

      //Datos administrativos
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //asociaciones
      _estados_text,
      _estados_vh

}
