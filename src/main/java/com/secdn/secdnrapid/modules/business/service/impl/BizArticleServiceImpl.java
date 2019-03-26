package com.secdn.secdnrapid.modules.business.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.gson.Gson;
import com.secdn.secdnrapid.common.utils.PageInfo;
import com.secdn.secdnrapid.common.utils.Query;
import com.secdn.secdnrapid.common.utils.RedisUtils;
import com.secdn.secdnrapid.modules.business.dto.BizArticleDto;
import com.secdn.secdnrapid.modules.business.entity.BizArticle;
import com.secdn.secdnrapid.modules.business.mapper.BizArticleMapper;
import com.secdn.secdnrapid.modules.business.service.BizArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.secdn.secdnrapid.modules.business.vo.BizArticleVO;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 *   @description : BizArticle 服务实现类
 *   ---------------------------------
 * 	 @author secdn
 *   @since 2019-03-15
 */
@Service
public class BizArticleServiceImpl extends ServiceImpl<BizArticleMapper, BizArticle> implements BizArticleService {

    @Autowired
    RedisUtils redisUtils;

    private final String RedisKey = "CATCH-ARTICLE-LIST-";

    private final static Gson gson = new Gson();

    @Override
    public PageInfo queryPage(BizArticleDto params) {
        Long typeId = params.getTypeId();
        Long pageNumber = params.getPageNumber();
        IPage<BizArticle> page;
;        if (StringUtils.isNotBlank(redisUtils.get(RedisKey + typeId + "-" + pageNumber))){
            page = gson.fromJson(redisUtils.get(RedisKey + typeId + "-" + pageNumber),Page.class);
        }else {
            page = this.page(
                    new Query<BizArticle>(params).getPage(),
                    new QueryWrapper<BizArticle>()
                            .eq(StringUtils.isNotBlank(typeId + ""),"type_id", typeId)
            );
            redisUtils.set(RedisKey + typeId + "-" + pageNumber,page);
        }

        return new PageInfo(page);
    }

    @Override
    public PageInfo queryAllPage(BizArticleDto params) {
        Long typeId = params.getTypeId();
        Long pageNumber = params.getPageNumber();
        IPage<BizArticleDto> page = new Query<BizArticleDto>(params).getPage();
        if (StringUtils.isNotBlank(redisUtils.get(RedisKey + typeId + "-" + pageNumber))){
            page = gson.fromJson(redisUtils.get(RedisKey + typeId + "-" + pageNumber),IPage.class);
        }else {
            page.setRecords(this.baseMapper.queryAllPage(page,params));
            redisUtils.set(RedisKey + typeId + "-" + pageNumber,page);
        }
        return new PageInfo(page);
    }

}