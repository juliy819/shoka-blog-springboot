package com.juliy.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.juliy.annotation.OptLogger;
import com.juliy.model.dto.ConditionDTO;
import com.juliy.model.dto.FavouriteDTO;
import com.juliy.model.vo.FavouriteAdminVO;
import com.juliy.model.vo.FavouriteClassify;
import com.juliy.model.vo.PageResult;
import com.juliy.model.vo.Result;
import com.juliy.service.FavouriteService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.juliy.constant.OptTypeConstant.*;

/**
 * 收藏夹控制器
 * @author juliy
 * @date 2023/6/21 16:21
 */
@RestController
@Tag(name = "收藏夹模块")
@RequestMapping("/favourite")
public class FavouriteController {

    private final FavouriteService favouriteService;

    @Autowired
    public FavouriteController(FavouriteService favouriteService) {
        this.favouriteService = favouriteService;
    }

    /**
     * 获取收藏夹列表
     * @return 收藏夹列表
     */
    @Operation(summary = "获取收藏夹列表")
    @GetMapping("/list")
    public Result<List<FavouriteClassify>> getFavourites() {
        return Result.success(favouriteService.listFavourites());
    }

    /**
     * 获取后台收藏夹列表
     * @param condition 查询条件
     * @return 后台收藏夹列表
     */
    @SaCheckPermission("favourite:list")
    @Operation(summary = "获取后台收藏夹列表")
    @GetMapping("/admin/list")
    public Result<PageResult<FavouriteAdminVO>> getFavouritesAdminByPage(ConditionDTO condition) {
        return Result.success(favouriteService.listFavouritesAdminByPage(condition));
    }

    /**
     * 获取收藏夹分类
     * @return 收藏夹分类
     */
    @SaCheckPermission("favourite:list")
    @Operation(summary = "获取收藏夹分类")
    @GetMapping("/admin/classify")
    public Result<List<String>> getFavouriteClassifies() {
        return Result.success(favouriteService.listFavouriteClassifies());
    }

    /**
     * 添加收藏项
     * @param favouriteDTO 要添加的收藏项
     */
    @Operation(summary = "添加收藏项")
    @SaCheckPermission("favourite:add")
    @OptLogger(value = ADD)
    @PostMapping
    public Result<?> addFavourite(@Validated @RequestBody FavouriteDTO favouriteDTO) {
        favouriteService.saveOrUpdateFavourite(favouriteDTO);
        return Result.success();
    }

    /**
     * 修改收藏项
     * @param favouriteDTO 要修改的收藏项
     */
    @Operation(summary = "修改收藏项")
    @SaCheckPermission("favourite:update")
    @OptLogger(value = UPDATE)
    @PutMapping
    public Result<?> updateFavourite(@Validated @RequestBody FavouriteDTO favouriteDTO) {
        favouriteService.saveOrUpdateFavourite(favouriteDTO);
        return Result.success();
    }

    /**
     * 删除收藏项
     * @param favouriteIds 要删除的收藏项ID列表
     */
    @Operation(summary = "删除收藏项")
    @SaCheckPermission("favourite:delete")
    @OptLogger(value = DELETE)
    @DeleteMapping("/{favouriteIds}")
    public Result<?> deleteCategories(@PathVariable Integer[] favouriteIds) {
        favouriteService.removeFavourites(List.of(favouriteIds));
        return Result.success();
    }
}
