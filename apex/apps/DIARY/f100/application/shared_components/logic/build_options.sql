prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>3957519964996905
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'DIARY'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(5362941543036328)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>4567101
,p_created_on=>wwv_flow_imp.dz('20251113001458Z')
,p_updated_on=>wwv_flow_imp.dz('20251113001458Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
wwv_flow_imp.component_end;
end;
/
