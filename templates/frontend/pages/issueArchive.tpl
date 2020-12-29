{**
* templates/frontend/pages/issueArchive.tpl
*
* Copyright (c) 2014-2018 Simon Fraser University
* Copyright (c) 2003-2018 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* @brief Display a list of recent issues.
*
* @uses $issues Array Collection of issues to display
* @uses $prevPage int The previous page number
* @uses $nextPage int The next page number
* @uses $showingStart int The number of the first item on this page
* @uses $showingEnd int The number of the last item on this page
* @uses $total int Count of all published monographs
*}

{capture assign="pageTitle"}
{if $prevPage}
{translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
{else}
{translate key="archive.archives"}
{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

<div class="page page_issue_archive">
	{include file="frontend/components/breadcrumbs.tpl" currentTitle=$pageTitle}

	{* No issues have been published *}
	{if empty($issues)}
	<p>{translate key="current.noCurrentIssueDesc"}</p>

	{* List issues *}
	{else}

	<div class="issues_archive" id="issues_archive_comedica"
		style="margin-left: 0px !important; margin-right: -10px !important; padding-top: 40px !important;">

		{foreach from=$issues item="issue"}
				<div class="item_issue">
					{include file="frontend/objects/issue_summary.tpl"}
				</div>
		{/foreach}

	</div>

	{*
	<ul class="issues_archive">
		{foreach from=$issues item="issue"}
		<li>
			{include file="frontend/objects/issue_summary.tpl"}
		</li>
		{/foreach}
	</ul>
	*}


	{* Pagination *}
	{if $prevPage > 1}
	{url|assign:"prevUrl" router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$prevPage}
	{elseif $prevPage === 1}
	{url|assign:"prevUrl" router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}
	{/if}
	{if $nextPage}
	{url|assign:"nextUrl" router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$nextPage}
	{/if}
	{include
	file="frontend/components/pagination.tpl"
	prevUrl=$prevUrl
	nextUrl=$nextUrl
	showingStart=$showingStart
	showingEnd=$showingEnd
	total=$total
	}
	{/if}
</div>

{literal}
<script>


	var issueList = document.getElementsByClassName("item_issue");
	var alter = "";

	for (var i = (issueList.length - 1); i >= 0; i--) {
		
			alter += '<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 item_issue">';
			alter += issueList[i].innerHTML;
			alter += '</div>';
		
	}

	var issue_area = document.getElementById("issues_archive_comedica");
	issue_area.innerHTML = "";
	issue_area.innerHTML = alter;



</script>
{/literal}

{include file="frontend/components/footer.tpl"}