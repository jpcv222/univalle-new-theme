{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal">

	{call_hook name="Templates::Index::journal"}
	
		{if $homepageImage}
			<div class="homepage_image">
				<center>
					<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}" >
				</center>				
			</div>
		{/if}
	{* Announcements *}
	{if $numAnnouncementsHomepage && $announcements|@count}
		<div class="cmp_announcements highlight_first">
			<h2>
				{translate key="announcement.announcements"}
			</h2>
			{foreach name=announcements from=$announcements item=announcement}
				{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
					{break}
				{/if}
				{if $smarty.foreach.announcements.iteration == 1}
					{include file="frontend/objects/announcement_summary.tpl" heading="h3"}
					<div class="more">
				{else}
					<article class="obj_announcement_summary">
						<h4>
							<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
								{$announcement->getLocalizedTitle()|escape}
							</a>
						</h4>
						<div class="date">
							{$announcement->getDatePosted()}
						</div>
					</article>
				{/if}
			{/foreach}
			</div><!-- .more -->
		</div>
	{/if}

	{* Latest issue *}
	{if $issue}
		<div class="current_issue row">

			{* Issue cover image *}
			<div style="width: 180px;" class = "col-lg-offset-0 col-lg-3 col-md-offset-0 col-md-3 col-sm-offset-5 col-sm-3 col-xs-offset-5  col-xs-3">
			{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
			{if $issueCover}
				<a class="cover" href="{url op="view" page="issue" path=$issue->getBestIssueId()}">
					<img src="{$issueCover|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
				</a>
			{/if}
			</div>

			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
			<center>
			<div class="row">
			<h2 class="current-issue-head">
				{translate key="journal.currentIssue"}
			</h2>
			</div>
			<div class="current_issue_title row">
				{$issue->getIssueIdentification()|strip_unsafe_html}
			</div>
			<div class="row">
			{* Published date *}
			{if $issue->getDatePublished()}
				<div class="published">
					<span class="label-bs label-bs-default">
						{translate key="submissions.published"} 
					</span>
					&nbsp;&nbsp;
					<span class="value">
						{$issue->getDatePublished()|date_format:$dateFormatShort}
					</span>
				</div>
			{/if}
			</div>
			</center>
			</div>
		</div> 

			{include file="frontend/objects/issue_toc.tpl"}
			<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="read_more">
				{translate key="journal.viewAllIssues"}
			</a>
		</div>


	{/if}

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<div class="additional_content">
			{$additionalHomeContent}
		</div>
	{/if}

{include file="frontend/components/footer.tpl"}
