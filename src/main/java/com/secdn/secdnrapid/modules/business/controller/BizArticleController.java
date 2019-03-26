package com.secdn.secdnrapid.modules.business.controller;

import java.util.Arrays;
import java.util.HashMap;


import com.secdn.secdnrapid.common.utils.PageInfo;
import com.secdn.secdnrapid.common.wrapper.WrapMapper;
import com.secdn.secdnrapid.common.wrapper.Wrapper;
import com.secdn.secdnrapid.modules.business.dto.BizArticleDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.*;

import com.secdn.secdnrapid.modules.business.service.BizArticleService;
import com.secdn.secdnrapid.modules.business.entity.BizArticle;



/**
 *
 *   @description : BizArticle 控制器
 *   ---------------------------------
 * 	 @author secdn
 *   @since 2019-03-15
 */
@RestController
@Api(value="/bizArticle", description="BizArticle 控制器")
@RequestMapping("/bizArticle")
public class BizArticleController {
    private final Logger logger = LoggerFactory.getLogger(BizArticleController.class);

    @Autowired
    public BizArticleService bizArticleService;

    /**
     * @description : 获取分页列表
     * ---------------------------------
     * @author : secdn
     * @since : Create in 2019-03-15
     */
    @PostMapping("/getBizArticleList")
    @ApiOperation(value="/getBizArticleList", notes="获取分页列表")
    public Wrapper<PageInfo> list(@RequestBody BizArticleDto params){
        PageInfo page = bizArticleService.queryPage(params);

        return WrapMapper.ok(page);
    }

    /**
     * 列表
     */
    @PostMapping("/queryAllList")
    @ApiOperation("文章列表")
    public Wrapper<PageInfo> queryAllList(@RequestBody BizArticleDto params){
        PageInfo page = bizArticleService.queryAllPage(params);

        return WrapMapper.ok( page);
    }


    /**
     * @description : 通过id获取BizArticle
     * ---------------------------------
     * @author : secdn
     * @since : Create in 2019-03-15
     */
    @RequestMapping("/getBizArticleById/{id}")
    public Wrapper<HashMap<String, Object>> info(@PathVariable("id") Long id){
        BizArticle bizArticle = bizArticleService.getById(id);

        HashMap<String, Object> stringObjectHashMap = new HashMap<>();
        stringObjectHashMap.put("bizArticle", bizArticle);
        return WrapMapper.ok(stringObjectHashMap);
    }

    /**
     * @description : 添加BizArticle
     * ---------------------------------
     * @author : secdn
     * @since : Create in 2019-03-15
     */
    @PostMapping("/addBizArticle")
    @ApiOperation(value="/addBizArticle", notes="添加BizArticle")
    public Wrapper<Object> save(@RequestBody BizArticle bizArticle){
        bizArticleService.save(bizArticle);

        return WrapMapper.ok();
    }

    /**
     * @description : 通过id更新BizArticle
     * ---------------------------------
     * @author : secdn
     * @since : Create in 2019-03-15
     */
    @PostMapping("/updateBizArticleById")
    @ApiOperation(value="/updateBizArticleById", notes="通过id更新BizArticle")
    public Wrapper<Object> update(@RequestBody BizArticle bizArticle){
        bizArticleService.updateById(bizArticle);

        return WrapMapper.ok();
    }

    /**
     * @description : 通过id删除BizArticle
     * ---------------------------------
     * @author : secdn
     * @since : Create in 2019-03-15
     */
    @PostMapping("/delete")
    @ApiOperation(value="/deleteBizArticleById", notes="通过id删除BizArticle")
    public Wrapper<Object> delete(@RequestBody Long[] ids){
        bizArticleService.removeByIds(Arrays.asList(ids));

        return WrapMapper.ok();
    }

}
