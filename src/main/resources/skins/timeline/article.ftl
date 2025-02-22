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
<#include "../../common-template/macro-common_head.ftl">
<#include "macro-comments.ftl">
<#include "../../common-template/macro-comment_script.ftl">
<!DOCTYPE html>
<html>
<head>
        <@head title="${article.articleTitle} - ${blogTitle}" description="${article.articleAbstract?html}">
            <link rel="stylesheet"
                  href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}"/>
        <#if previousArticlePermalink??>
            <link rel="prev" title="${previousArticleTitle}" href="${servePath}${previousArticlePermalink}">
        </#if>
        <#if nextArticlePermalink??>
            <link rel="next" title="${nextArticleTitle}" href="${servePath}${nextArticlePermalink}">
        </#if>
        </@head>
</head>
<body>
${topBarReplacement}
        <#include "header.ftl">
<div class="wrapper">
    <div class="container">
        <div class="fn-clear">
            <div<#if article?? && article.articleToC?? && article.articleToC?size &gt; 0> class="dynamic-l"</#if>>
                <div class="module">
                    <article class="article">
                        <time class="article-time">
                            <span>
                                ${article.articleUpdateDate?string("yy-MM-dd HH:mm")}
                            </span>
                        </time>
                        <h2 class="article-title">
                            <a href="${servePath}${article.articlePermalink}">
                            ${article.articleTitle}
                            </a>
                            <#if article.articlePutTop>
                            <sup>
                                ${topArticleLabel}
                            </sup>
                            </#if>
                        </h2>
                        <br>
                        <div class="vditor-reset">
                        ${article.articleContent}
                        </div>
                        <#if "" != article.articleSign.signHTML?trim>
                        <p>
                            ${article.articleSign.signHTML}
                        </p>
                        </#if>
                        <span class="ico-tags ico" title="${tagLabel}">
                            <#list article.articleTags?split(",") as articleTag>
                                <a rel="tag"
                                   href="${servePath}/tags/${articleTag?url('UTF-8')}">${articleTag}</a>
                                <#if articleTag_has_next>,</#if>
                            </#list>
                        </span>
                        <span class="ico-author ico" title="${authorLabel}">
                            <a rel="author" href="${servePath}/authors/${article.authorId}">${article.authorName}</a>
                        </span>
                        <#if commentable>
                        <span class="ico-comment ico" title="${commentLabel}">
                            <a rel="nofollow" href="${servePath}${article.articlePermalink}#comments">
                                <#if article.articleCommentCount == 0>
                                    ${noCommentLabel}
                                <#else>
                                    ${article.articleCommentCount}
                                </#if>
                            </a>
                        </span>
                        </#if>
                        <span class="ico-view ico" title="${viewLabel}">
                            <a rel="nofollow" href="${servePath}${article.articlePermalink}">
                            <span data-uvstaturl="${servePath}${article.articlePermalink}">0</span>
                            </a>
                        </span>
                    </article>
                    <div class="fn-clear" style="margin-top: 30px;">
                        <#if nextArticlePermalink??>
                        <div class="left">
                            <a href="${servePath}${nextArticlePermalink}">
                                <span class="ico-pre">«</span>
                                <span class="ft-pre">${nextArticleTitle}</span>
                            </a>
                        </div>
                        </#if>
                        <#if previousArticlePermalink??>
                        <div class="right">
                            <a href="${servePath}${previousArticlePermalink}">
                                <span class="left ft-next">${previousArticleTitle}</span>
                                <span class="ico-next">»</span>
                            </a>
                        </div>
                        </#if>
                    </div>
                    <#if 0 != relevantArticlesDisplayCount>
                    <div id="relevantArticles"></div>
                    </#if>
                    <#if 0 != randomArticlesDisplayCount>
                    <div id="randomArticles"></div>
                    </#if>
                    <#if externalRelevantArticlesDisplayCount?? && 0 != externalRelevantArticlesDisplayCount>
                    <div id="externalRelevantArticles"></div>
                    </#if>
                    <@comments commentList=articleComments article=article></@comments>
                </div>
            </div>
            <#if article?? && article.articleToC?? && article.articleToC?size &gt; 0>
            <div class="dynamic-r">
                <div class="module">
                    <h3 class="title">${tocLabel}</h3>
                    <#include "../../common-template/toc.ftl"/>
                </div>
            </div>
            </#if>
        </div>
    </div>
</div>
        <#include "footer.ftl">
        <@comment_script oId=article.oId commentable=article.commentable>
        page.tips.externalRelevantArticlesDisplayCount = "${externalRelevantArticlesDisplayCount}";
            <#if 0 != externalRelevantArticlesDisplayCount>
        page.loadExternalRelevantArticles("<#list article.articleTags?split(",") as articleTag>${articleTag}<#if articleTag_has_next>,</#if></#list>");
            </#if>
            <#if 0 != randomArticlesDisplayCount>
        page.loadRandomArticles();
            </#if>
            <#if 0 != relevantArticlesDisplayCount>
        page.loadRelevantArticles('${article.oId}', '<h4>${relevantArticles1Label}</h4>');
            </#if>
        </@comment_script>
</body>
</html>
