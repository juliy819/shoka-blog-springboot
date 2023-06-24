package com.juliy.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 收藏项VO
 * @author juliy
 * @date 2023/6/21 17:16
 */
@Data
@Schema(description = "收藏项")
public class FavouriteVO {

    /**
     * 标题
     */
    @Schema(description = "标题")
    private String title;

    /**
     * 描述
     */
    @Schema(description = "描述")
    private String description;

    /**
     * 图标
     */
    @Schema(description = "图标")
    private String icon;

    /**
     * 链接
     */
    @Schema(description = "链接")
    private String url;

}
