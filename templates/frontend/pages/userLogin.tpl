{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2000-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login"}

<div class="page page_login">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}

	{* A login message may be displayed if the user was redireceted to the
	   login page from another request. Examples include if login is required
	   before dowloading a file. *}
       <div> <center>
	{if $loginMessage}
		<p>
			{translate key=$loginMessage}
		</p>
	{/if}

	<form class="cmp_form cmp_form login" id="login" method="post" action="{$loginUrl}">
		{csrf}

        <div class="row" style="padding-bottom:15px">
            <img src="https://drive.google.com/uc?export=view&amp;id=13EoTenYyzedvC7AizX8BwyMw_VfYLowH" width="32px" height="24px">
        </div>

		{if $error}
			<div class="pkp_form_error">
				{translate key=$error reason=$reason}
			</div>
		{/if}

		<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />

		<fieldset class="fields">
			<div class="username row">
				<label>
					<span class="label">
						{translate key="user.username"}
						<span class="required">*</span>
						<span class="pkp_screen_reader">
							{translate key="common.required"}
						</span>
					</span>
					<input type="text" name="username" id="username" value="{$username|escape}" maxlength="32" required>
				</label>
			</div>
			<div class="password row">
				<label>
					<span class="label">
						{translate key="user.password"}
						<span class="required">*</span>
						<span class="pkp_screen_reader">
							{translate key="common.required"}
						</span>
					</span>
					<input type="password" name="password" id="password" value="{$password|escape}" password="true" maxlength="32" required>
					
				</label>
			</div>
			<div class="remember checkbox row">
				<label>
					<input type="checkbox" name="remember" id="remember" value="1" checked="$remember">
					<span class="label">
						{translate key="user.login.rememberUsernameAndPassword"}
					</span>
				</label>
			</div>
			<div class="buttons row">
            <div class="">
				<button class="submit submit btn btn-secondary btn-lg btn-block" type="submit">
					{translate key="user.login"}
				</button>
                </div>
                <div class="">
                    <div class="col-lg-9 col-md-9">
                    <strong>
                        <a href="{url page="login" op="lostPassword"}">
                            {translate key="user.login.forgotPassword"}
                        </a>
                    </strong>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        {if !$disableUserReg}
                            {url|assign:registerUrl page="user" op="register" source=$source}
                            <a href="{$registerUrl}" class="register">
                                {translate key="user.login.registerNewAccount"}
                            </a>
                        {/if}
                    </div>
                </div>

			</div>
		</fieldset>
	</form>

    </div> </center>
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
