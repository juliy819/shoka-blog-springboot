package com.juliy.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 后台收藏项VO
 * @author juliy
 * @date 2023/6/24 10:19
 */
@Data
@Schema(description = "后台收藏项VO")
public class FavouriteAdminVO {

    /**
     * id
     */
    @Schema(description = "id")
    private Integer id;

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
     * 分类
     */
    @Schema(description = "分类")
    private String classify;

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

    /**
     * 排序值
     */
    @Schema(description = "排序值")
    private Integer orderNum;
}
