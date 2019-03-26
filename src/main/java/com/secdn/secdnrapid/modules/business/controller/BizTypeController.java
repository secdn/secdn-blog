package com.secdn.secdnrapid.modules.business.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import com.secdn.secdnrapid.common.utils.PageInfo;
import com.secdn.secdnrapid.common.wrapper.WrapMapper;
import com.secdn.secdnrapid.common.wrapper.Wrapper;
import com.secdn.secdnrapid.modules.business.dto.BizTypeDto;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.*;

import com.secdn.secdnrapid.modules.business.service.BizTypeService;
import com.secdn.secdnrapid.modules.business.entity.BizType;



/**
 *
 *   @description : BizType 控制器
 *   ---------------------------------
 * 	 @author secdn
 *   @since 2019-03-15
 */
@RestController
@Api(value="/bizType", description="BizType 控制器")
@RequestMapping("/bizType")
public class BizTypeController {
    private final Logger logger = LoggerFactory.getLogger(BizTypeController.class);

    @Autowired
    public BizTypeService bizTypeService;

    /**
     * @description : 获取分页列表
     * ---------------------------------
     * @author : secdn
     * @since : Create in 2019-03-15
     */
    @PostMapping("/getBizTypeList")
    @ApiOperation(value="/getBizTypeList", notes="获取分页列表")
    public Wrapper<PageInfo> list(@RequestBody BizTypeDto params){
        PageInfo page = bizTypeService.queryPage(params);

        return WrapMapper.ok(page);
    }

    /**
     * 列表
     */
    @PostMapping("/treeList")
    @ApiOperation("所有栏目递归列表")
    public Wrapper<List<BizType>> treeList(){
        List<BizType> allTypeList = bizTypeService.getAllTypeList();
        return WrapMapper.ok(allTypeList);
    }


    /**
     * @description : 通过id获取BizType
     * ---------------------------------
     * @author : secdn
     * @since : Create in 2019-03-15
     */
    @PostMapping("/getBizTypeById/{id}")
    public Wrapper<HashMap<String, Object>> info(@PathVariable("id") Long id){
        BizType bizType = bizTypeService.getById(id);

        HashMap<String, Object> stringObjectHashMap = new HashMap<>();
        stringObjectHashMap.put("bizType", bizType);
        return WrapMapper.ok(stringObjectHashMap);
    }

    /**
     * @description : 添加BizType
     * ---------------------------------
     * @author : secdn
     * @since : Create in 2019-03-15
     */
    @PostMapping("/addBizType")
    @ApiOperation(value="/addBizType", notes="添加BizType")
    public Wrapper<Object> save(@RequestBody BizType bizType){
        bizTypeService.save(bizType);

        return WrapMapper.ok();
    }

    /**
     * @description : 通过id更新BizType
     * ---------------------------------
     * @author : secdn
     * @since : Create in 2019-03-15
     */
    @PostMapping("/updateBizTypeById")
    @ApiOperation(value="/updateBizTypeById", notes="通过id更新BizType")
    @RequiresPermissions("business:BizType:update")
    public Wrapper<Object> update(@RequestBody BizType bizType){
        bizTypeService.updateById(bizType);

        return WrapMapper.ok();
    }

    /**
     * @description : 通过id删除BizType
     * ---------------------------------
     * @author : secdn
     * @since : Create in 2019-03-15
     */
    @PostMapping("/delete")
    @RequiresPermissions("business:BizType:delete")
    @ApiOperation(value="/deleteBizTypeById", notes="通过id删除BizType")
    public Wrapper<Object> delete(@RequestBody Long[] ids){
        bizTypeService.removeByIds(Arrays.asList(ids));

        return WrapMapper.ok();
    }

}
