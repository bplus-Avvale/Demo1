@EndUserText.label: 'Modelo consumo anotaciones'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ztbai_C_Anotacion_U
  as projection on ztbai_I_Anotacion_U as Anotaciones
{
@Search.defaultSearchElement: true   
key  IdAnotacion,
@Search.defaultSearchElement: true   
@Consumption.valueHelpDefinition: [{entity.name: 'ztbai_vm_estados' , entity.element: 'IdEstado' }]  
@ObjectModel.text.element: ['Estado']        
      IdEstado,           
      _estados_text.TextoEstado as Estado,
@Search.defaultSearchElement: true      
      TipoFactura,
      Bukrs,
      Belnr,
      Gjahr,
      Buzei,
      IdLote,

      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _estados_text
}
