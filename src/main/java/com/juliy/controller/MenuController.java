package com.juliy.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.juliy.annotation.OptLogger;
import com.juliy.model.dto.ConditionDTO;
import com.juliy.model.dto.MenuDTO;
import com.juliy.model.vo.MenuTree;
import com.juliy.model.vo.MenuVO;
import com.juliy.model.vo.Result;
import com.juliy.service.MenuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.juliy.constant.OptTypeConstant.*;

/**
 * 菜单控制器
 * @author juliy
 * @date 2023/3/13 11:55
 */
@Tag(name = "菜单模块")
@Slf4j
@RestController
@RequestMapping("/menu")
public class MenuController {

    private final MenuService menuService;

    @Autowired
    public MenuController(MenuService menuService) {
        this.menuService = menuService;
    }

    /**
     * 获取菜单列表
     * @param condition 查询条件
     * @return 菜单列表
     */
    @Operation(summary = "获取菜单列表")
    @SaCheckPermission("menu:list")
    @GetMapping("/list")
    public Result<List<MenuVO>> getMenus(ConditionDTO condition) {
        return Result.success(menuService.listMenus(condition));
    }

    /**
     * 添加菜单
     * @param menu 菜单
     */
    @Operation(summary = "添加菜单")
    @SaCheckPermission("menu:add")
    @OptLogger(value = ADD)
    @PostMapping
    public Result<?> saveMenu(@Validated @RequestBody MenuDTO menu) {
        menuService.saveOrUpdateMenu(menu);
        return Result.success();
    }

    /**
     * 修改菜单
     * @param menu 菜单
     */
    @Operation(summary = "修改菜单")
    @SaCheckPermission("menu:update")
    @OptLogger(value = UPDATE)
    @PutMapping
    public Result<?> updateMenu(@Validated @RequestBody MenuDTO menu) {
        menuService.saveOrUpdateMenu(menu);
        return Result.success();
    }

    /**
     * 删除菜单
     * @param menuId 菜单id
     */
    @Operation(summary = "删除菜单")
    @SaCheckPermission("menu:delete")
    @OptLogger(value = DELETE)
    @DeleteMapping("/{menuId}")
    public Result<?> deleteMenu(@PathVariable Integer menuId) {
        menuService.removeMenu(menuId);
        return Result.success();
    }

    /**
     * 获取菜单树
     * @return 菜单树
     */
    @Operation(summary = "获取菜单树")
    @SaCheckPermission("menu:list")
    @GetMapping("/getMenuTree")
    public Result<List<MenuTree>> getMenuTree() {
        return Result.success(menuService.listMenuTree());
    }

    /**
     * 获取菜单选项树
     * @return 菜单选项树
     */
    @Operation(summary = "获取菜单选项树")
    @SaCheckPermission("menu:list")
    @GetMapping("/getMenuOptionTree")
    public Result<List<MenuTree>> getMenuOptionTree() {
        return Result.success(menuService.listMenuOptionTree());
    }
}
