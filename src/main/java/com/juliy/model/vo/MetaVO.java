package com.juliy.model.vo;

import com.juliy.utils.CommonUtils;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;
import lombok.Data;

/**
 * 菜单其它信息
 * @author juliy
 * @date 2023/3/13 21:59
 */
@Data
@Builder
@Schema(description = "菜单其它信息")
public class MetaVO {

    /**
     * 菜单名称
     */
    @Schema(description = "菜单名称")
    private String title;

    /**
     * 菜单图标
     */
    @Schema(description = "菜单图标")
    private String icon;

    /**
     * 是否隐藏
     */
    @Schema(description = "是否隐藏")
    private Boolean hidden;

    /**
     * 内链地址（http(s)://开头）
     */
    @Schema(description = "内链地址（http(s)://开头）")
    private String link;

    public MetaVO(String title, String icon, Boolean hidden, String link) {
        this.title = title;
        this.icon = icon;
        this.hidden = hidden;
        if (CommonUtils.isHttp(link)) {
            this.link = link;
        }
    }
}
