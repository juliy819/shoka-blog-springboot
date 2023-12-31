package com.juliy.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 菜单DTO
 * @author juliy
 * @date 2023/3/13 11:51
 */
@Data
@Schema(description = "菜单DTO")
public class MenuDTO {
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
     * 菜单名称
     */
    @NotBlank(message = "菜单名称不能为空")
    @Schema(description = "菜单名称")
    private String menuName;

    /**
     * 菜单类型（M目录 C菜单 B按钮）
     */
    @NotBlank(message = "菜单类型不能为空")
    @Schema(description = "菜单类型（M目录 C菜单 B按钮）")
    private String menuType;

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
    @NotNull(message = "菜单排序不能为空")
    @Schema(description = "菜单排序")
    private Integer orderNum;

    /**
     * 权限标识
     */
    @Schema(description = "权限标识")
    private String perms;
}
