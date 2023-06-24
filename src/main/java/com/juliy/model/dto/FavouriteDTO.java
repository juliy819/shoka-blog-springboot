package com.juliy.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 收藏项DTO
 * @author juliy
 * @date 2023/6/24 11:29
 */
@Data
@Schema(description = "收藏项DTO")
public class FavouriteDTO {

    /**
     * 收藏项id
     */
    @Schema(description = "收藏项id")
    private Integer id;

    /**
     * 标题
     */
    @NotBlank(message = "标题不能为空")
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
    @NotBlank(message = "链接不能为空")
    @Schema(description = "链接")
    private String url;

    /**
     * 排序值
     */
    @Schema(description = "排序值")
    private Integer orderNum;
}
