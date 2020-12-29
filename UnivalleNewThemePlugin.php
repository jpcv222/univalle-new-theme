<?php

import('lib.pkp.classes.plugins.ThemePlugin');

class UnivalleNewThemePlugin extends ThemePlugin {

	public function __construct()
	{
		parent::__construct();

	}

	public function isActive() {
		if (defined('SESSION_DISABLE_INIT')) return true;
		return parent::isActive();
	}
/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {
		$base_url = Config::getVar('general', 'base_url');
		$lessVariables = ["@theme_name: 'univalle-new-theme';", "@base_url: '$base_url';"];
		$this->setParent('defaultthemeplugin');
		$this->addStyle(
			'child-stylesheet',
			'styles/index.less',
			array('addLessVariables' => join($lessVariables)));	

		$this->addStyle('bbody', 'styles/backend/index.less',array( 'contexts' => 'backend' ));
			
		$this->addStyle('child-stylesheet-boot', 'bootstrap/css/bootstrap.min.css');
		// Load Bootsrap's dropdown
		$this->addScript('popper', 'js/lib/popper/popper.js');
		$this->addScript('bsUtil', 'js/lib/bootstrap/util.js');
		$this->addScript('bsDropdown', 'js/lib/bootstrap/dropdown.js');
		$this->addScript('bsJs', 'bootstrap/js/bootstrap.min.js');

		// Load custom JavaScript for this theme
		$this->addScript('default', 'js/main.js');

	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return 'Tema Nuevo Univalle';
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return 'Tema customizado por la Universidad del Valle, partiendo de el tema por defecto';
	}

	/**
	 * Get the name of the settings file to be installed on new journal
	 * creation.
	 * @return string
	 */
	function getContextSpecificPluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
	}

	/**
	 * Get the name of the settings file to be installed site-wide when
	 * OJS is installed.
	 * @return string
	 */
	function getInstallSitePluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
	}

}

?>
