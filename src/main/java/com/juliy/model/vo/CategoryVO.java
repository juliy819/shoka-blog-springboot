package com.juliy.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 分类VO
 * @author juliy
 * @date 2023/3/25 11:28
 */
@Data
@Schema(description = "分类VO")
public class CategoryVO {
    /**
     * 分类id
     */
    @Schema(description = "分类id")
    private Integer id;

    /**
     * 分类名
     */
    @Schema(description = "分类名")
    private String categoryName;

    /**
     * 文章数量
     */
    @Schema(description = "文章数量")
    private Integer articleCount;
}
