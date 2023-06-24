package com.juliy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.juliy.entity.Favourite;
import com.juliy.model.dto.ConditionDTO;
import com.juliy.model.vo.FavouriteAdminVO;
import com.juliy.model.vo.FavouriteClassify;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 收藏夹mapper
 * @author juliy
 * @date 2023/6/21 15:56
 */
@Mapper
public interface FavouriteMapper extends BaseMapper<Favourite> {

    /**
     * 查询收藏夹列表
     * @return 收藏夹列表
     */
    List<FavouriteClassify> selectFavourites();

    /**
     * 查询后台收藏夹列表
     * @param current   页码
     * @param size      数量
     * @param condition 查询条件
     * @return 后台收藏夹列表
     */
    List<FavouriteAdminVO> selectFavouritesAdminByPage(@Param("current") Long current, @Param("size") Long size,
                                                       @Param("condition") ConditionDTO condition);

    /**
     * 按条件查询收藏项数量
     * @param condition 查询条件
     * @return 收藏项数量
     */
    Long selectFavouriteCountByCondition(@Param("condition") ConditionDTO condition);

    /**
     * 查询收藏夹分类列表
     * @return 收藏夹分类列表
     */
    List<String> selectFavouriteClassifies();
}