package com.juliy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.juliy.entity.Favourite;
import com.juliy.model.dto.ConditionDTO;
import com.juliy.model.dto.FavouriteDTO;
import com.juliy.model.vo.FavouriteAdminVO;
import com.juliy.model.vo.FavouriteClassify;
import com.juliy.model.vo.PageResult;

import java.util.List;

/**
 * 收藏夹服务接口
 * @author juliy
 * @date 2023/6/21 15:57
 */
public interface FavouriteService extends IService<Favourite> {

    /**
     * 获取收藏夹列表
     * @return 收藏夹列表
     */
    List<FavouriteClassify> listFavourites();

    /**
     * 获取后台收藏夹列表
     * @param condition 查询条件
     * @return 后台收藏夹列表
     */
    PageResult<FavouriteAdminVO> listFavouritesAdminByPage(ConditionDTO condition);

    /**
     * 获取收藏夹分类列表
     * @return 收藏夹分类列表
     */
    List<String> listFavouriteClassifies();

    /**
     * 添加或修改收藏夹项
     * @param favourite 收藏夹项
     */
    void saveOrUpdateFavourite(FavouriteDTO favouriteDTO);

    /**
     * 删除收藏夹项
     * @param favouriteIds 收藏夹项id列表
     */
    void removeFavourites(List<Integer> favouriteIds);

}