package com.secdn.secdnrapid.modules.business.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.secdn.secdnrapid.modules.business.dto.BizArticleDto;
import com.secdn.secdnrapid.modules.business.entity.BizArticle;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.secdn.secdnrapid.modules.business.vo.BizArticleVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 *
 *   @description : BizArticle Mapper 接口
 *   ---------------------------------
 * 	 @author secdn
 *   @since 2019-03-15
 */
@Repository
public interface BizArticleMapper extends BaseMapper<BizArticle> {

    List<BizArticleDto> queryAllPage(IPage page,@Param("bizArticleDto")BizArticleDto params);

}