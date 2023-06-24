package com.juliy.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 收藏夹分类
 * @author juliy
 * @date 2023/6/21 16:05
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "收藏夹分类")
public class FavouriteClassify {
    /**
     * 分类名
     */
    @Schema(description = "分类名")
    String classify;

    /**
     * 收藏项列表
     */
    @Schema(description = "收藏项列表")
    List<FavouriteVO> favouriteList;
}
