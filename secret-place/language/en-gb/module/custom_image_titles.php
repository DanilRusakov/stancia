<?php
$_['extension_name']                    = 'Custom Image Titles';

// Heading
$_['heading_title']                     = '<i class="fa fa-picture-o" style="font-size:14px;color:#F7951D;"></i> <strong>' . $_['extension_name'] . '</strong>' . (defined("CIT_STATUS") ? '<span style="display:inline-block;margin-left:20px;">' . (CIT_STATUS ? '<i style="color:#3c763d">[ Enabled ]</i>' : '<i style="color:#a94442">[ Disabled ]</i>') . '</span>' : '');

// Buttons
$_['button_apply']                      = 'Apply';
$_['button_upgrade']                    = 'Upgrade';
$_['button_purchase_license']           = 'Purchase Additional License';

// Tabs
$_['tab_settings']                      = 'Settings';
$_['tab_support']                       = 'Support';
$_['tab_about']                         = 'About';
$_['tab_general']                       = 'General';
$_['tab_faq']                           = 'FAQ';
$_['tab_services']                      = 'Services';
$_['tab_changelog']                     = 'Changelog';
$_['tab_extension']                     = 'Extension';

// Text
$_['text_success_upgrade']              = '<strong>Success!</strong> You have upgraded ' . $_['extension_name'] . ' to version <strong>%s</strong>!';
$_['text_success_update']               = '<strong>Success!</strong> You have updated ' . $_['extension_name'] . ' settings!';
$_['text_success_hooks_update']         = '<strong>Success!</strong> ' . $_['extension_name'] . ' event hooks updated!';
$_['text_toggle_navigation']            = 'Toggle navigation';
$_['text_license']                      = 'License';
$_['text_extension_information']        = 'Extension information';
$_['text_legal_notice']                 = 'Legal notice';
$_['text_terms']                        = 'Terms &amp; Conditions';
$_['text_support_subject']              = $_['extension_name'] . ' support needed';
$_['text_license_text']                 = 'Please be aware that this product has a <strong>per-domain license</strong>, meaning you can use it <em>only on a single domain</em> (sub-domains count as separate domains). <strong>You will need to purchase a separate license for each domain you wish to use this extension on.</strong>';
$_['text_other_extensions']             = 'If you like this extension you might also be interested in <a href="%s" class="alert-link" target="_blank">my other extensions</a>.';
$_['text_module']                       = 'Modules';
$_['text_faq']                          = 'Frequently Asked Questions';
$_['text_saving']                       = 'Saving ...';
$_['text_upgrading']                    = 'Upgrading ...';
$_['text_loading']                      = 'Loading ...';
$_['text_canceling']                    = 'Canceling ...';

// Help texts
$_['help_display_caption']              = 'Display main image caption below the image on product page.';
$_['help_use_default_value']            = 'If secondary language field is left blank, use the value from the admin language field.';
$_['help_remove_sql_changes']           = 'Remove all SQL changes when <strong>uninstalling</strong> the module.';
$_['help_purchase_additional_licenses'] = 'You need to purchase additional extension licenses to activate the extension on these stores';

// Entry
$_['entry_installed_version']           = 'Installed version';
$_['entry_extension_status']            = 'Extension status';
$_['entry_show_alt_text']               = 'Show \'Alternative text\' field';
$_['entry_display_caption']             = 'Display caption';
$_['entry_use_default_value']           = 'Use admin language value';
$_['entry_remove_sql_changes']          = 'Remove SQL changes';
$_['entry_extension_name']              = 'Name';
$_['entry_extension_compatibility']     = 'Compatibility';
$_['entry_extension_store_url']         = 'Store URL';
$_['entry_copyright_notice']            = 'Copyright notice';
$_['entry_active_on']                   = 'Active on';
$_['entry_inactive_on']                 = 'Inactive on';

// Error
$_['error_permission']                  = '<strong>Error!</strong> You do not have permission to modify extension ' . $_['extension_name'] . '!';
$_['error_warning']                     = '<strong>Warning!</strong> Please check the form carefully for errors!';
$_['error_vqmod']                       = '<strong>Warning!</strong> VQMod class cannot be found. Please verify that vQmod has been installed. You can download vQmod for free from the official website <a href="http://www.vqmod.com" class="alert-link">www.vqmod.com</a>!';
$_['error_vqmod_script']                = '<strong>Warning!</strong> The extension vQmod script is not working. Please check that it exists and is not disabled. The extension will not work without this script.';
$_['error_missing_table']               = '<strong>Error!</strong> Your SQL database seems to be missing table \'%s\'!';
$_['error_missing_column']              = '<strong>Error!</strong> Your SQL table \'%s\' seems to be missing column \'%s\'!';
$_['error_unsaved_settings']            = '<strong>Warning!</strong> There are unsaved settings! Please save the settings.';
$_['error_version']                     = '<strong>Info!</strong> ' . $_['extension_name'] . ' version <strong>%s</strong> installation files found. You need to upgrade ' . $_['extension_name'] . '!';
$_['error_upgrade_database']            = '<strong>Error!</strong> Failed to upgrade database structure!';
$_['error_ajax_request']                = 'An AJAX error occured!';
