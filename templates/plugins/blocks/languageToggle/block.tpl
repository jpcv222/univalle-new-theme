{**
 * plugins/blocks/languageToggle/block.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site sidebar menu -- language toggle.
 *}

 {* ORIGINAL

{if $enableLanguageToggle}
<div class="pkp_block block_language">
	<span class="title">
		{translate key="common.language"} 
	</span>

	<div class="content">
		<ul>
			{foreach from=$languageToggleLocales item=localeName key=localeKey}
				<li class="locale_{$localeKey|escape}{if $localeKey == $currentLocale} current{/if}">
					<a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}">
						{$localeName}
					</a>
				</li>
			{/foreach}
		</ul>
	</div>
</div><!-- .block_language -->
{/if}

*}

{* EDITED BLOCK *}

{if $enableLanguageToggle}
<div id="fixed-language" class="fixed-lng fixed-lng-aux">
	
	<div class="display-lng  hidden-xs hidden-sm" role="group" aria-label="...">
		
			{foreach from=$languageToggleLocales item=localeName key=localeKey}
				
						{if $localeName eq 'English'}
						<a title="{$localeName}"  href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}"  class="zoom-image  locale_{$localeKey|escape}{if $localeKey == $currentLocale} current{/if}">
							<img src="{$baseUrl}/plugins/themes/univalle/images/en_US.png" >
						{else $localeName eq 'Español(España)'}
						<a title="Español"  href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}"  class="zoom-image  locale_{$localeKey|escape}{if $localeKey == $currentLocale} current{/if}">
							<img src="{$baseUrl}/plugins/themes/univalle/images/es_LAT.jpg" style="width:32px !important; height:24px !important;">
						{/if}
					</a>
				
			{/foreach}
		
	</div>
	<div class=" btn-xs hidden-lg hidden-md" role="group" aria-label="...">
		
			{foreach from=$languageToggleLocales item=localeName key=localeKey}
				
						{if $localeName eq 'English'}
						<a title="{$localeName}"  href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}"  class="zoom-image  locale_{$localeKey|escape}{if $localeKey == $currentLocale} current{/if}">
							<img src="{$baseUrl}/plugins/themes/univalle/images/en_US.png">
						{else $localeName eq 'Español(España)'}
						<a title="Español"  href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}"  class="zoom-image  locale_{$localeKey|escape}{if $localeKey == $currentLocale} current{/if}">
							<img src="{$baseUrl}/plugins/themes/univalle/images/es_LAT.jpg" style="width:32px !important; height:24px !important;">
						{/if}
					</a>
				
			{/foreach}
		
	</div>
</div><!-- .block_language -->
{/if}