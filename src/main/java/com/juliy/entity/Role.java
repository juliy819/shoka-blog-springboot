package com.juliy.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 角色
 * @author juliy
 * @date 2023/3/15 17:03
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("t_role")
public class Role {

    /**
     * 角色id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 角色名
     */
    private String roleName;

    /**
     * 角色描述
     */
    private String roleDesc;

    /**
     * 是否禁用 (0否 1是)
     */
    private Integer isDisable;

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
