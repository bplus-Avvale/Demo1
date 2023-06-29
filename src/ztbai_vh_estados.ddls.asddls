@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ayuda de busqueda'
define view entity ZTBAI_VH_ESTADOS
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'ZTBAI_ID_ESTADO ')
{

  key domain_name,
  key value_position,
      @Semantics.language:true
  key language,
      value_low as Value,
      @Semantics.text: true
      text      as Description
}
