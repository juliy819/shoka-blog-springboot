package com.juliy.model.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
 * 菜单树
 * @author juliy
 * @date 2023/10/12 17:06
 */
@Data
@Schema(description = "菜单树")
public class MenuTree {
    /**
     * 菜单id
     */
    @Schema(description = "菜单id")
    private Integer id;

    /**
     * 父菜单id
     */
    @JsonIgnore
    @Schema(description = "父菜单id")
    private Integer parentId;

    /**
     * 菜单名称
     */
    @Schema(description = "菜单名称")
    private String label;

    /**
     * 子菜单树
     */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @Schema(description = "子菜单树")
    private List<MenuTree> children;

}
