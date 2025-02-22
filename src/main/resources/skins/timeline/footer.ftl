<#--

    Solo - A small and beautiful blogging system written in Java.
    Copyright (c) 2010-present, b3log.org

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<div class="footer">
    <div class="container fn-clear">
        <#include "../../common-template/macro-user_site.ftl"/>
        <div class="ft__center">
        <@userSite dir="ne"/>
        </div>
        <div class="left">
            <span>&copy; ${year}</span> <a href="${servePath}">${blogTitle}</a> ${footerContent}
            Powered by <a href="https://solo.b3log.org" target="_blank">Solo</a>&nbsp;&nbsp;
            Theme ${skinDirName}
            <sup>[<a href="http://themify.me/demo/themes/postline/" target="_blank">ref</a>]</sup>
            by <a rel="friend" href="http://vanessa.b3log.org" target="_blank">Vanessa</a>.
        </div>
        <div class="right fn-clear">
            <span class="left">
                <span>
                    ${viewCount1Label}
                    <span data-uvstaturl="${servePath}">0</span>
                    &nbsp;&nbsp;
                </span>
                <span>
                    ${articleCount1Label}
                    ${statistic.statisticPublishedBlogArticleCount}
                    &nbsp;&nbsp;
                </span>
                <#if commentable>
                <span>
                    ${commentCount1Label}
                    ${statistic.statisticPublishedBlogCommentCount}
                </span>
                </#if>
            </span>
            <span class="ico-translate" onclick="timeline.translate()"></span>
        </div>
    </div>
</div>
<div class="ico-top none" onclick="Util.goTop()" title="TOP"></div>
<script type="text/javascript" src="${staticServePath}/js/lib/jquery/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${staticServePath}/js/common${miniPostfix}.js?${staticResourceVersion}" charset="utf-8"></script>
<script type="text/javascript" src="${staticServePath}/skins/${skinDirName}/js/${skinDirName}${miniPostfix}.js?${staticResourceVersion}" charset="utf-8"></script>
<#include "../../common-template/label.ftl">
<script type="text/javascript">
    Label.localeString = "${localeString}"
    Label.yearLabel = "${yearLabel}"
    Label.monthLabel = "${monthLabel}"
    Label.moreLabel = "${moreLabel}"
    Label.viewLabel = "${viewLabel}"
    Label.commentLabel = "${commentLabel}"
    Label.noCommentLabel = "${noCommentLabel}"
    Label.tagLabel = "${tagLabel}"
    Label.topArticleLabel = "${topArticleLabel}"
    Label.authorLabel = "${authorLabel}"
    Label.updatedLabel = "${updatedLabel}"
</script>
${plugins}
