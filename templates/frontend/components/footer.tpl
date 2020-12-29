{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *
 * @author Juan Pablo Castro 2019
 * GitHub jpcv222
 *
 *}
	
</div> <!-- pkp_structure_content -->

    </div> <!-- close col -->

    <div class = "col-lg-3 col-md-3 col-sm-4 col-xs-12 sidebar_comedica">
        <center>

            {* Sidebars *}
            {if empty($isFullWidth)}
                {capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
                {if $sidebarCode}
                    <div class="pkp_structure_sidebar left" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
                        {$sidebarCode}
                    </div><!-- pkp_sidebar.left -->
                {/if}
            {/if}
        </center>

    </div> <!-- close col -->

</div> <!-- close row -->


<div id="pkp_content_footer" class="pkp_structure_footer_wrapper home-contacto" role="contentinfo">

	<div class="home-footer-contacto">
    <div class="container">
        <div class="footer-logo">
            <a href="https://www.univalle.edu.co" title="Universidad del Valle">
                    <img class="logo-img" src="http://www.univalle.edu.co/images/logo-footer.png" alt="Universidad del Valle" width="112" height="159">
            </a>
        </div>
        <div class="nombre-contacto">
            <h5>Universidad del Valle</h5>
            <ul>
                <li>Cali - Colombia</li>
               
                <li>© 1994 - 2020</li>
            </ul>
        </div>
        <div class="address">
            <h5>Dirección:</h5>
            <ul>
              <li>Ciudad Universitaria Meléndez</li>  
              <li>Calle 13 # 100-00</li>
              <li>&nbsp;</li>
                <li>Sede San Fernando</li>
                <li>Calle 4B N° 36-00</li>
               
            </ul>
        </div>

        <div class="pbx">
            <h5>PBX:</h5>
            <ul>                                
                <li>+57 2 3212100</li>
              
              <li>Línea gratuita: 018000 22 00 21</li>
                <li>A.A.25360</li>
            </ul>
        </div>

        <div class="social">
            <h5>Redes Sociales:</h5>
            <ul>
                <li><a href="https://www.facebook.com/universidaddelvalle" target="_blank"><img src="http://www.univalle.edu.co/images/footericons/facebook.png"></a></li>
                <li><a href="https://www.youtube.com/user/universidaddelvalle1" target="_blank"><img src="http://www.univalle.edu.co/images/footericons/youtube.png"></a></li>
                <li><a href="https://twitter.com/univallecol" target="_blank"><img src="http://www.univalle.edu.co/images/footericons/twitter.png"></a></li>
            </ul>
        </div> 
    </div>
    </div>
    <section class="home-copyright">
        <div class="container">
                <p>2020 <a href="https://www.univalle.edu.co/" target="_blank">Universidad del Valle</a> - Vigilada MinEducación</p>
        </div>
    </section>

</div><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}


{literal}
 //Go to www.addthis.com/dashboard to customize your tools 
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5daa616d32e02902"></script>
{/literal}


</body>
</html>
