{**
 * templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $publishedArticles array Lists of articles published in this issue
 *   sorted by section.
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 *}


	{* Issue introduction area above articles *}
	<div class="heading row">

	</div>

	<div class="row">
		{* PUb IDs (eg - DOI) *}
		{foreach from=$pubIdPlugins item=pubIdPlugin}
			{assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
			{if $pubId}
				{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
				<div class="pub_id {$pubIdPlugin->getPubIdType()|escape}">
					<span class="type">
						{$pubIdPlugin->getPubIdDisplayType()|escape}:
					</span>
					<span class="id">
						{if $doiUrl}
							<a href="{$doiUrl|escape}">
								{$doiUrl}
							</a>
						{else}
							{$pubId}
						{/if}
					</span>
				</div>
			{/if}
		{/foreach}
	</div>

		<div class="row">
		{* Description *}
			{if $issue->hasDescription()}
			<div class="description">
				{$issue->getLocalizedDescription()|strip_unsafe_html}
			</div>
		{/if}
		</div>

<div class="obj_issue_toc row">

	{* Indicate if this is only a preview *}
	{if !$issue->getPublished()}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="editor.issues.preview"}
	{/if}


	{* Full-issue galleys *}
	{if $issueGalleys}
		<div class="galleys">
			<h2>
				{translate key="issue.fullIssue"}
			</h2>
			<ul class="galleys_links">
				{foreach from=$issueGalleys item=galley}
					<li>
						{include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
					</li>
				{/foreach}
			</ul>
		</div>
	{/if}

	{* Articles *}
	<div class="sections">
	 
	{foreach name=sections from=$publishedArticles item=section}
		<blockquote >
		{if $section.articles}
			{if $section.title}	  
			
			<div class="row">	
					<div class="row comedica-title-section">
					<h2 class='amx-gris'>
						{$section.title|escape}
					</h2>
					</div>
			{/if}
			<div class="cmp_article_list articles">
					
				{foreach from=$section.articles item=article}
						
					<div class="col-sm-12 col-lg-6 col-md-6 col-xs-12">
						{include file="frontend/objects/article_summary.tpl"}
					</div>

				{/foreach}
				</div>
			</div>
		{/if}
		
		</blockquote>
	{/foreach}
	</div><!-- .sections -->
</div>


{literal}
<script>
/*
	var titleListArticleSummary = document.getElementsByClassName("title-comedica");

	for (var i = (titleListArticleSummary.length - 1); i >= 0; i--) {
			if(titleListArticleSummary[i].innerHTML.length >=60){
			titleListArticleSummary[i].innerHTML = titleListArticleSummary[i].innerHTML.substring(0,60)+"...";
			}
	}

	var authorListArticleSummary = document.getElementsByClassName("author-comedica");

	for (var i = (authorListArticleSummary.length - 1); i >= 0; i--) {
			if(authorListArticleSummary[i].innerHTML.length >=60){
			authorListArticleSummary[i].innerHTML = authorListArticleSummary[i].innerHTML.substring(0,60)+"...";
			}
	}
*/
</script>
{/literal}