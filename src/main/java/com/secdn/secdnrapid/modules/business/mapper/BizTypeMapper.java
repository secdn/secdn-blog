package com.secdn.secdnrapid.modules.business.mapper;

import com.secdn.secdnrapid.modules.business.entity.BizType;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *
 *   @description : BizType Mapper 接口
 *   ---------------------------------
 * 	 @author secdn
 *   @since 2019-03-15
 */
@Repository
public interface BizTypeMapper extends BaseMapper<BizType> {

    /**
     * 根据父菜单，查询子菜单
     * @param parentId 父菜单ID
     */
    List<BizType> queryListParentId(Long parentId);

}