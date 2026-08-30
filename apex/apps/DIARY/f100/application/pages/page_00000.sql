prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>3957519964996905
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'DIARY'
);
wwv_flow_imp_page.create_page(
 p_id=>0
,p_name=>'Global Page'
,p_step_title=>'Global Page'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_page_component_map=>'14'
,p_created_on=>wwv_flow_imp.dz('20251113001459Z')
,p_last_updated_on=>wwv_flow_imp.dz('20251113001459Z')
,p_created_by=>'ADMIN'
,p_last_updated_by=>'ADMIN'
);
wwv_flow_imp.component_end;
end;
/
