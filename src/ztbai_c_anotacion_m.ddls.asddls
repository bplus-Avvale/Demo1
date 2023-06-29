@EndUserText.label: 'Consumer'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZTBAI_C_ANOTACION_M provider contract transactional_query as projection on ZTBAI_I_ANOTACION_M 
{
key  uuid,

@Search.defaultSearchElement: true   
 IdAnotacion,
@Search.defaultSearchElement: true   
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
      _estados_text,
      _estados_vh
}
