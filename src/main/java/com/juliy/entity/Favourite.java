package com.juliy.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 收藏夹
 * @author juliy
 * @date 2023/6/21 15:31
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("t_favourite")
public class Favourite {

    /**
     * 收藏夹id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 标题
     */
    private String title;

    /**
     * 描述
     */
    private String description;

    /**
     * 分类
     */
    private String classify;

    /**
     * 图标
     */
    private String icon;

    /**
     * 链接
     */
    private String url;

    /**
     * 排序值
     */
    private Integer orderNum;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;
}
