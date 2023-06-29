@AbapCatalog.sqlViewName: 'ZTBAI_VM_ESTADO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Maestro de estados'
define view ztbai_vm_estados as select from ztbai_estados
{
    key id_estado as IdEstado,
    texto_estado  as TextoEstado
}
