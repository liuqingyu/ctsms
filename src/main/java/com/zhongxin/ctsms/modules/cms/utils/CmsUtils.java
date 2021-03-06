/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/zhongxin/ctsms">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.zhongxin.ctsms.modules.cms.utils;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.zhongxin.ctsms.common.mapper.JsonMapper;
import com.zhongxin.ctsms.common.persistence.Page;
import com.zhongxin.ctsms.common.utils.CacheUtils;
import com.zhongxin.ctsms.common.utils.SpringContextHolder;
import com.zhongxin.ctsms.modules.cms.entity.Article;
import com.zhongxin.ctsms.modules.cms.entity.Category;
import com.zhongxin.ctsms.modules.cms.entity.Link;
import com.zhongxin.ctsms.modules.cms.entity.Site;
import com.zhongxin.ctsms.modules.cms.service.ArticleService;
import com.zhongxin.ctsms.modules.cms.service.CategoryService;
import com.zhongxin.ctsms.modules.cms.service.LinkService;
import com.zhongxin.ctsms.modules.cms.service.SiteService;

/**
 * 内容管理工具类
 * @author ThinkGem
 * @version 2013-5-29
 */
public class CmsUtils {
	
	private static SiteService siteService = SpringContextHolder.getBean(SiteService.class);
	private static CategoryService categoryService = SpringContextHolder.getBean(CategoryService.class);
	private static ArticleService articleService = SpringContextHolder.getBean(ArticleService.class);
	private static LinkService linkService = SpringContextHolder.getBean(LinkService.class);

	private static final String CMS_CACHE = "cmsCache";
	
	/**
	 * 获得站点列表
	 */
	public static List<Site> getSiteList(){
		@SuppressWarnings("unchecked")
		List<Site> siteList = (List<Site>)CacheUtils.get(CMS_CACHE, "siteList");
		if (siteList == null){
			Page<Site> page = new Page<Site>(1, -1);
			page = siteService.find(page, new Site());
			siteList = page.getList();
			CacheUtils.put(CMS_CACHE, "siteList", siteList);
		}
		return siteList;
	}
	
	/**
	 * 获得站点信息
	 * @param id 站点编号
	 */
	public static Site getSite(long siteId){
		long id = 1L;
		if (siteId > 0){
			id = siteId;
		}
		for (Site site : getSiteList()){
			if (site.getId() == id){
				return site;
			}
		}
		return new Site(id);
	}
	
	/**
	 * 获得主导航列表
	 * @param siteId 站点编号
	 */
	public static List<Category> getMainNavList(long siteId){
		@SuppressWarnings("unchecked")
		List<Category> mainNavList = (List<Category>)CacheUtils.get(CMS_CACHE, "mainNavList_"+siteId);
		if (mainNavList == null){
			Category category = new Category();
			category.setSite(new Site(siteId));
			category.setParent(new Category(1L));
			category.setInMenu(Category.SHOW);
			Page<Category> page = new Page<Category>(1, -1);
			page = categoryService.find(page, category);
			mainNavList = page.getList();
			CacheUtils.put(CMS_CACHE, "mainNavList_"+siteId, mainNavList);
		}
		return mainNavList;
	}
	
	/**
	 * 获取栏目
	 * @param id 栏目编号
	 * @return
	 */
	public static Category getCategory(long categoryId){
		return categoryService.get(categoryId);
	}
	
	/**
	 * 获得栏目列表
	 * @param siteId 站点编号
	 * @param parentId 分类父编号
	 * @param number 获取数目
	 * @param param  预留参数，例： key1:'value1', key2:'value2' ...
	 */
	public static List<Category> getCategoryList(long siteId, long parentId, int number, String param){
		Page<Category> page = new Page<Category>(1, number, -1);
		Category category = new Category();
		category.setSite(new Site(siteId));
		category.setParent(new Category(parentId));
		if (StringUtils.isNotBlank(param)){
			@SuppressWarnings({ "unused", "rawtypes" })
			Map map = JsonMapper.getInstance().fromJson("{"+param+"}", Map.class);
		}
		page = categoryService.find(page, category);
		return page.getList();
	}

	/**
	 * 获取栏目
	 * @param ids 栏目编号
	 * @return
	 */
	public static List<Category> getCategoryListByIds(String categoryIds){
		return categoryService.findByIds(categoryIds);
	}
	
	/**
	 * 获取文章
	 * @param id 文章编号
	 * @return
	 */
	public static Article getArticle(long articleId){
		return articleService.get(articleId);
	}
	
	/**
	 * 获取文章列表
	 * @param siteId 站点编号
	 * @param categoryId 分类编号
	 * @param number 获取数目
	 * @param param  预留参数，例： key1:'value1', key2:'value2' ...
	 * 			posid	推荐位（1：首页焦点图；2：栏目页文章推荐；）
	 * 			image	文章图片（1：有图片的文章）
	 *          orderBy 排序字符串
	 * @return
	 */
	public static List<Article> getArticleList(long siteId, long categoryId, int number, String param){
		Page<Article> page = new Page<Article>(1, number, -1);
		Article article = new Article(new Category(categoryId, new Site(siteId)));
		if (StringUtils.isNotBlank(param)){
			@SuppressWarnings({ "rawtypes" })
			Map map = JsonMapper.getInstance().fromJson("{"+param+"}", Map.class);
			if (new Integer(1).equals(map.get("posid")) || new Integer(2).equals(map.get("posid"))){
				article.setPosid(String.valueOf(map.get("posid")));
			}
			if (new Integer(1).equals(map.get("image"))){
				article.setImage(Article.YES);
			}
			if (StringUtils.isNotBlank((String)map.get("orderBy"))){
				page.setOrderBy((String)map.get("orderBy"));
			}
		}
		article.setDelFlag(Article.DEL_FLAG_NORMAL);
		page = articleService.find(page, article, false);
		return page.getList();
	}
	
	/**
	 * 获取链接
	 * @param id 文章编号
	 * @return
	 */
	public static Link getLink(long linkId){
		return linkService.get(linkId);
	}
	
	/**
	 * 获取链接列表
	 * @param siteId 站点编号
	 * @param categoryId 分类编号
	 * @param number 获取数目
	 * @param param  预留参数，例： key1:'value1', key2:'value2' ...
	 * @return
	 */
	public static List<Link> getLinkList(long siteId, long categoryId, int number, String param){
		Page<Link> page = new Page<Link>(1, number, -1);
		Link link = new Link(new Category(categoryId, new Site(siteId)));
		if (StringUtils.isNotBlank(param)){
			@SuppressWarnings({ "unused", "rawtypes" })
			Map map = JsonMapper.getInstance().fromJson("{"+param+"}", Map.class);
		}
		link.setDelFlag(Link.DEL_FLAG_NORMAL);
		page = linkService.find(page, link, false);
		return page.getList();
	}
	
	// ============== Cms Cache ==============
	
	public static Object getCache(String key) {
		return CacheUtils.get(CMS_CACHE, key);
	}

	public static void putCache(String key, Object value) {
		CacheUtils.put(CMS_CACHE, key, value);
	}

	public static void removeCache(String key) {
		CacheUtils.remove(CMS_CACHE, key);
	}
}