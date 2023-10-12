package com.juliy.model.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 菜单VO
 * @author juliy
 * @date 2023/10/12 17:18
 */
@Data
@Schema(description = "菜单VO")
public class MenuVO {
    /**
     * 菜单id
     */
    @Schema(description = "菜单id")
    private Integer id;

    /**
     * 父菜单id
     */
    @Schema(description = "父级菜单id")
    private Integer parentId;

    /**
     * 类型（M目录 C菜单 B按钮）
     */
    @Schema(description = "类型（M目录 C菜单 B按钮）")
    private String menuType;

    /**
     * 菜单名称
     */
    @Schema(description = "菜单名称")
    private String menuName;

    /**
     * 路由地址
     */
    @Schema(description = "路由地址")
    private String path;

    /**
     * 菜单图标
     */
    @Schema(description = "菜单图标")
    private String icon;

    /**
     * 菜单组件
     */
    @Schema(description = "菜单组件")
    private String component;

    /**
     * 权限标识
     */
    @Schema(description = "权限标识")
    private String perms;

    /**
     * 是否为页面 (0否 1是)
     */
    @Schema(description = "是否为页面 (0否 1是)")
    private Integer isFrame;

    /**
     * 是否隐藏 (0否 1是)
     */
    @Schema(description = "是否隐藏 (0否 1是)")
    private Integer isHidden;

    /**
     * 是否禁用 (0否 1是)
     */
    @Schema(description = "是否禁用 (0否 1是)")
    private Integer isDisable;

    /**
     * 菜单排序
     */
    @Schema(description = "菜单排序")
    private Integer orderNum;

    /**
     * 创建时间
     */
    @Schema(description = "创建时间")
    private LocalDateTime createTime;

    /**
     * 子菜单列表
     */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @Schema(description = "子菜单列表")
    private List<MenuVO> children;
}
