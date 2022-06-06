--APPLICATION_NAME

SELECT  APPLICATION_NAME||' ('||APPLICATION_ID||')' APPLICATION_NAME, to_number(APPLICATION_ID) APPLICATION_ID
FROM    APEX_APPLICATIONS
WHERE   WORKSPACE_ID = V('WORKSPACE_ID')
ORDER BY APPLICATION_NAME;

--THEME STYLES

select s.name d,
    s.theme_style_id r
from apex_application_theme_styles s, apex_application_themes t
where s.application_id = t.application_id
    and s.theme_number = t.theme_number
    and s.application_id = :app_id
    and t.ui_type_name   = 'DESKTOP'
    and t.is_current = 'Yes'
order by 1

