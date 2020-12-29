{**
* lib/pkp/templates/frontend/components/header.tpl
*
* Copyright (c) 2014-2018 Simon Fraser University
* Copyright (c) 2003-2018 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* @brief Common frontend site header.
*
* @uses $isFullWidth bool Should this page be displayed without sidebars? This
* represents a page-level override, and doesn't indicate whether or not
* sidebars have been configured for thesite.
*
* @author Juan Pablo Castro 2019
* GitHub jpcv222
*
*}
{strip}
{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
{assign var="showingLogo" value=false}
{/if}
{/strip}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:" _":"-"}" xml:lang="{$currentLocale|replace:" _":"-"}">
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{include file="frontend/components/headerHead.tpl"}

<body class="pkp_page_{$requestedPage|escape|default:" index"} pkp_op_{$requestedOp|escape|default:"index"}{if
	$showingLogo} has_site_logo{/if}" dir="{$currentLocaleLangDir|escape|default:" ltr"}">
	<!--
	FONDO: Vector Designed By Watonmedia from  <a href="https://pngtree.com//freepng/modern-shape-abstract-triangle-background_3637984.html"></a>
	-->
	<div class="cmp_skip_to_content">
		<a href="#pkp_content_main">{translate key="navigation.skip.main"}</a>
		<a href="#pkp_content_nav">{translate key="navigation.skip.nav"}</a>
		<a href="#pkp_content_footer">{translate key="navigation.skip.footer"}</a>
	</div>
	<div class="pkp_structure_page">
		<div class="row" style="height: 1px;">
		</div>
		{* Header *}
		<header class="pkp_structure_head" id="headerNavigationContainer" role="banner">
			<div class="pkp_head_wrapper head_wrapper_sticky" id="headWrapper">

				<div class="pkp_site_name_wrapper">
					{* Logo or site title. Only use <h1> heading on the homepage.
						Otherwise that should go to the page title. *}
						<div class='row'>

							<div class='col-md-2 col-lg-2 logo_colombiamedica_size' id="logo-colombiamedica">

								<div class="row">
									{if $requestedOp == 'index'}
									<h1 class="pkp_site_name">
										{else}
										<div class="pkp_site_name">
											{/if}
											{if $currentContext && $multipleContexts}
											{url|assign:"homeUrl" page="index" router=$smarty.const.ROUTE_PAGE}
											{else}
											{url|assign:"homeUrl" context="index" router=$smarty.const.ROUTE_PAGE}
											{/if}
											{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
											<a href="{$homeUrl}" class="is_img">
												<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"
													url"}" width="{$displayPageHeaderLogo.width|escape}"
													height="{$displayPageHeaderLogo.height|escape}" {if
													$displayPageHeaderLogo.altText !=''
													}alt="{$displayPageHeaderLogo.altText|escape}"
													{else}alt="{translate key=" common.pageHeaderLogo.altText"}"{/if} />
											</a>
											{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo &&
											is_string($displayPageHeaderTitle)}
											<a href="{$homeUrl}" class="is_text">{$displayPageHeaderTitle}</a>
											{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo &&
											is_array($displayPageHeaderTitle)}
											<a href="{$homeUrl}" class="is_img">
												<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"
													url"}" alt="{$displayPageHeaderTitle.altText|escape}"
													width="{$displayPageHeaderTitle.width|escape}"
													height="{$displayPageHeaderTitle.height|escape}" />
											</a>
											{else}
											<a href="{$homeUrl}" class="is_img">
												<img src="{$baseUrl}/templates/images/structure/logo.png"
													alt="{$applicationName|escape}" title="{$applicationName|escape}"
													width="180" height="90" />
											</a>
											{/if}
											{if $requestedOp == 'index'}
									</h1>
									{else}
								</div>
								{/if}

							</div>
							<!--col-->
						</div>
						<!--col-->

						<div class='col-md-10 col-lg-10 content_options_sticky' id="content_options">
							<!--
							<div class="row" id="logo_univalle_row">
								<div class='col-md-12 col-lg-12'>
								<a id='logo_univalle' href='https://www.univalle.edu.co/' class='pull-right'>
									<img src='{$baseUrl}/plugins/themes/univalle/images/logo_uv.png' class='hidden-sm hidden-xs logo_uv_head'>
								</a>
								</div>
							</div>
							-->
							<div class="row" style="margin-left: 35px;">
								{* Primary site navigation *}
								{if $currentContext}
								<nav class="pkp_navigation_primary_row" aria-label="{translate|escape key="
									common.navigation.site"}">
									{* Primary navigation menu for current application *}
									{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
								</nav>
								{/if}
							</div>
							<div class="row" style="margin-left: 15px;">

								<div class='col-md-9 col-lg-9'>
									<div class="pkp_navigation_primary_wrapper">

										{* Search form *}
										{include file="frontend/components/searchForm_simple.tpl"}
									</div>
								</div>
								<div class='col-lg-offset-1  col-md-offset-1 col-md-2 col-lg-2 '>

									<nav class="pkp_navigation_user_wrapper" id="navigationUserWrapper"
										aria-label="{translate|escape key=" common.navigation.user"}">
										{load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user"
										liClass="profile"}
									</nav>
								</div>


							</div>
							<!--row-->
						</div>
						<!--col-->




				</div>
				<!--row-->
			</div>

	</div><!-- .pkp_head_wrapper -->

	<!-- <link rel="icon" type="image/png" href="{$baseUrl}/plugins/themes/univalle/images/f_icon.png" /> -->
	</header><!-- .pkp_structure_head -->

	
{literal}
<script>
window.onscroll = function() {myFunction()};

var navbar = document.getElementById("headerNavigationContainer");
var language = document.getElementById("fixed-language");
//var logo_univalle = document.getElementById("logo_univalle_row");
var head_wrapper = document.getElementById("headWrapper");
var logo_colombiamedica = document.getElementById("logo-colombiamedica");
var content_options = document.getElementById("content_options");

var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky");
    //language.classList.add("fixed-lng-aux");
    //logo_univalle.classList.add("logo_univalle_none");
    //head_wrapper.classList.add("head_wrapper_sticky");
    //logo_colombiamedica.classList.add("logo_colombiamedica_size");
    //content_options.classList.add("content_options_sticky");
  } else {
    navbar.classList.remove("sticky");
    //language.classList.remove("fixed-lng-aux");
    //logo_univalle.classList.remove("logo_univalle_none");
    //head_wrapper.classList.remove("head_wrapper_sticky");
    //logo_colombiamedica.classList.remove("logo_colombiamedica_size");
    //content_options.classList.remove("content_options_sticky");
  }
}
</script>
{/literal}


	<div class="row page_content_comedica">
		{* Wrapper for page content and sidebars *}
		{if $isFullWidth}
		{assign var=hasSidebar value=0}
		{/if}
		<div class="col-sm-8 col-xs-12  col-lg-9 col-md-9 content_comedica">
			<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}" style="width:100% !important;">
				<div id="pkp_content_main" class="pkp_structure_main" role="main" style="width:100% !important;">
				</div><!-- pkp_structure_main -->