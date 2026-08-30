prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>3957519964996905
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'DIARY'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(5363595057036331)
,p_name=>'Breadcrumb'
,p_created_on=>wwv_flow_imp.dz('20251113001458Z')
,p_updated_on=>wwv_flow_imp.dz('20251113002402Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5363790745036332)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>1
,p_created_on=>wwv_flow_imp.dz('20251113001458Z')
,p_updated_on=>wwv_flow_imp.dz('20251113001458Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5380156782090766)
,p_short_name=>'Diary Entries'
,p_link=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>2
,p_created_on=>wwv_flow_imp.dz('20251113002402Z')
,p_updated_on=>wwv_flow_imp.dz('20251113002402Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
wwv_flow_imp.component_end;
end;
/
