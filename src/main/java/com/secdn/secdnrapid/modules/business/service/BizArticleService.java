package com.secdn.secdnrapid.modules.business.service;

import com.secdn.secdnrapid.common.utils.PageInfo;
import com.secdn.secdnrapid.modules.business.dto.BizArticleDto;
import com.secdn.secdnrapid.modules.business.entity.BizArticle;
import com.baomidou.mybatisplus.extension.service.IService;



/**
 *   @description : BizArticle 服务接口
 *   ---------------------------------
 * 	 @author secdn
 *   @since 2019-03-15
 */
public interface BizArticleService extends IService<BizArticle> {

    PageInfo queryPage(BizArticleDto params);

    PageInfo queryAllPage(BizArticleDto params);
}

