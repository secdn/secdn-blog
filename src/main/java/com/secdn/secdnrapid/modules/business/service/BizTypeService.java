package com.secdn.secdnrapid.modules.business.service;

import com.secdn.secdnrapid.common.utils.PageInfo;
import com.secdn.secdnrapid.modules.business.dto.BizTypeDto;
import com.secdn.secdnrapid.modules.business.entity.BizType;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 *   @description : BizType 服务接口
 *   ---------------------------------
 * 	 @author secdn
 *   @since 2019-03-15
 */
public interface BizTypeService extends IService<BizType> {

    PageInfo queryPage(BizTypeDto params);

    /**
     * 根据父菜单，查询子菜单
     * @param parentId 父菜单ID
     */
    List<BizType> queryListParentId(Long parentId);

    /**
     *
     */
    List<BizType> getAllTypeList();
}

