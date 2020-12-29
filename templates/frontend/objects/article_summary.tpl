{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showDatePublished bool Show the date this article was published?
 * @uses $hideGalleys bool Hide the article galleys for this article?
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 *}
{assign var=articlePath value=$article->getBestArticleId()}

{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}
<div class="comedica-panel">
<div class="panel panel-default ">
  <div class="panel-body panel-galley">

	<div class="obj_article_summary">

	<div class="row header-article">
		{if $article->getLocalizedCoverImage()}
			<div class="cover cover-article">
				<a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if} class="file">
					<img src="{$article->getLocalizedCoverImageUrl()|escape}"{if $article->getLocalizedCoverImageAltText() != ''} alt="{$article->getLocalizedCoverImageAltText()|escape}"{else} alt="{translate key="article.coverPage.altText"}"{/if}>
				</a>
			</div>
	
		{/if}

		<div class="title">
			<a class="title-comedica" {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if}>
				{$article->getLocalizedTitle()|strip_unsafe_html}
				{if $article->getLocalizedSubtitle()}
					<span class="subtitle">
						{$article->getLocalizedSubtitle()|escape}
					</span>
				{/if}
			</a>
		</div>

		{if $showAuthor || $article->getPages() || ($article->getDatePublished() && $showDatePublished)}
		<div class="meta">
			{if $showAuthor}
			<div class="authors author-comedica">
				{$article->getAuthorString()}
			</div>
			{/if}

		</div>
		{/if}

		</div>
		<hr class="hr-article_summary">

		{* DOI (requires plugin) *}
					{foreach from=$pubIdPlugins item=pubIdPlugin}
						{if $pubIdPlugin->getPubIdType() != 'doi'}
							{continue}
						{/if}
						{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
						{if $pubId}
							{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
							<div class="item doi content_doi">
								<label class="label-pubid-article_summary">
									{capture assign=translatedDOI}{translate key="plugins.pubIds.doi.readerDisplayName"}{/capture}
									{translate key="semicolon" label=$translatedDOI}
								<label>
								<span class="value">
									<a href="{$doiUrl}">
										{$doiUrl}
									</a>
							
								</span>
							</div>
					{/if}
					{/foreach}

		<div class='views meta'>
					Views: 
						<font color='#DA251D'><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> | </font>
								<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> {$article->getViews()} |
								{if $galleys}
									{foreach from=$galleys item=galley name=galleyList}
										<span class="glyphicon glyphicon-download" aria-hidden="true"></span> {$galley->getGalleyLabel()} - {$galley->getViews()} | 
									{/foreach}
								{/if}
					</div>

		{* Online date *}

		{if $article->getDatePublished()}
				<div class="online-date">
					Online date: {$article->getDatePublished()}
				</div>
			{/if}
		

			{* Page numbers for this article *}
			{if $article->getPages()}
				<div class="pages">
				<span class= "glyphicon glyphicon-list-alt"></span> Pages: 
					{$article->getPages()|escape}
				</div>
			{/if}


			
		{if !$hideGalleys}
			<ul class="galleys_links">
				{foreach from=$article->getGalleys() item=galley}
				
					
					{if $primaryGenreIds}
						{assign var="file" value=$galley->getFile()}
						{if !$galley->getRemoteUrl() && !($file && in_array($file->getGenreId(), $primaryGenreIds))}
							{continue}
						{/if}
					{/if}
					<li>
						{assign var="hasArticleAccess" value=$hasAccess}
						{if ($article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN)}
							{assign var="hasArticleAccess" value=1}
						{/if}
						{include file="frontend/objects/galley_link.tpl" parent=$article hasAccess=$hasArticleAccess purchaseFee=$currentJournal->getSetting('purchaseArticleFee') purchaseCurrency=$currentJournal->getSetting('currency')}
					</li>
			
				{/foreach}
				
			</ul>
		{/if}

					

		{call_hook name="Templates::Issue::Issue::Article"}
	</div>

	</div>
</div>
</div>


