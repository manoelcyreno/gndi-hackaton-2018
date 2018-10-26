<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="container-fluid" id="wrapper">

	<header id="banner" role="banner">
		<div class="container gndi-flex-inline">
			<div id="heading" class="gndi-flex-inline">
				<h1 class="site-title">
					<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
						<img class="gndi-logo" alt="${logo_description}" width="253px" src="${images_folder}/logo-gndi.png" width="${site_logo_width}" />
					</a>
				</h1>

				<#if is_signed_in>
					<#if has_navigation && is_setup_complete>
						<#include "${full_templates_path}/navigation.ftl" />
					</#if>
				</#if>

			</div>

			<#if is_signed_in>
				<div class="search-user-wrapper">
					<#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone")>

					<#--  TIP: You have to hide the Search Portlet Header title with CSS  -->

					<div class="my-embed-search-example pull-left">
						<@liferay.search default_preferences="${freeMarkerPortletPreferences}" />
					</div>

					<div class="pull-left">
						<#include "${full_templates_path}/user_menu.ftl" />
					</div>
				</div>
			</#if>
		</div>
		
	</header>

	<section id="content" class="container">

		<h1 class="hide-accessible">${the_title}</h1>

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>

	<footer id="footer" role="contentinfo">
		<div class="container">
			<p class="powered-by">
				<@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
			</p>
		</div>
	</footer>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->

</body>

</html>