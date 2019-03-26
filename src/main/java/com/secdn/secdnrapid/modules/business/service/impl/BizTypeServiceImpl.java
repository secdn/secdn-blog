package com.secdn.secdnrapid.modules.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.secdn.secdnrapid.common.utils.PageInfo;
import com.secdn.secdnrapid.common.utils.Query;
import com.secdn.secdnrapid.modules.business.dto.BizTypeDto;
import com.secdn.secdnrapid.modules.business.entity.BizType;
import com.secdn.secdnrapid.modules.business.mapper.BizTypeMapper;
import com.secdn.secdnrapid.modules.business.service.BizTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *   @description : BizType 服务实现类
 *   ---------------------------------
 * 	 @author secdn
 *   @since 2019-03-15
 */
@Service
public class BizTypeServiceImpl extends ServiceImpl<BizTypeMapper, BizType> implements BizTypeService {

    @Override
    public PageInfo queryPage(BizTypeDto params) {

        IPage<BizType> page = this.page(
                new Query<BizType>(params).getPage(),
                new QueryWrapper<BizType>()
        );
        List<BizType> list =page.getRecords();
        for (BizType bizType : list) {
            if (bizType.getPid()!= null && bizType.getPid() != 0L) {
                bizType.setParentName(baseMapper.selectById(bizType.getPid()).getName());
            }
        }

        return new PageInfo(page);
    }

    @Override
    public List<BizType> queryListParentId(Long parentId) {
        List<BizType> menuList = baseMapper.queryListParentId(parentId);
        List<BizType> menuTreeList = getMenuTreeList(menuList);
        return menuTreeList;
    }

    @Override
    public List<BizType> getAllTypeList() {
        return queryListParentId(0L);
    }


    /**
     * 递归
     */
    private List<BizType> getMenuTreeList(List<BizType> menuList){
        List<BizType> subMenuList = new ArrayList<>();
        for(BizType entity : menuList){
            entity.setList(getMenuTreeList(queryListParentId(entity.getId())));
            subMenuList.add(entity);
        }
        return subMenuList;
    }

}