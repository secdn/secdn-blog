package com.secdn.secdnrapid.modules.business.dto;

import com.secdn.secdnrapid.modules.business.entity.BizArticle;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author secdn
 * @create 2019-03-25
 */
@Data
@ApiModel
public class BizArticleDto extends BizArticle {
    /**
     * 当前页
     */
    @ApiModelProperty("当前页")
    private long pageNumber = 1;

    /**
     * 每页条数
     */
    @ApiModelProperty("每页条数")
    private long pageSize = 10;

    /**
     * 排序字段
      */
    @ApiModelProperty("排序字段")
    private String orderByField;

    /**
     * 排序方式
     */
    @ApiModelProperty("排序方式")
    private String orderBy;

    private String typeName;
}
