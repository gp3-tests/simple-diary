prompt --application/shared_components/navigation/lists/navigation_menu
begin
--   Manifest
--     LIST: Navigation Menu
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>3957519964996905
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'DIARY'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(5364009681036336)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>4576056
,p_created_on=>wwv_flow_imp.dz('20251113001458Z')
,p_updated_on=>wwv_flow_imp.dz('20251113002402Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5375775980036435)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20251113001459Z')
,p_updated_on=>wwv_flow_imp.dz('20251113001459Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5379262389090757)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Diary Entries'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2'
,p_created_on=>wwv_flow_imp.dz('20251113002402Z')
,p_updated_on=>wwv_flow_imp.dz('20251113002402Z')
,p_created_by=>'ADMIN'
,p_updated_by=>'ADMIN'
);
wwv_flow_imp.component_end;
end;
/
