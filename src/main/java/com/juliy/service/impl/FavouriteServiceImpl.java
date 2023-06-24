package com.juliy.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.juliy.entity.Favourite;
import com.juliy.exception.ServiceException;
import com.juliy.mapper.FavouriteMapper;
import com.juliy.model.dto.ConditionDTO;
import com.juliy.model.dto.FavouriteDTO;
import com.juliy.model.vo.FavouriteAdminVO;
import com.juliy.model.vo.FavouriteClassify;
import com.juliy.model.vo.PageResult;
import com.juliy.service.FavouriteService;
import com.juliy.utils.BeanCopyUtils;
import com.juliy.utils.PageUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

/**
 * 收藏夹服务接口实现类
 * @author juliy
 * @date 2023/6/21 15:57
 */
@Slf4j
@Service
public class FavouriteServiceImpl extends ServiceImpl<FavouriteMapper, Favourite> implements FavouriteService {

    private final FavouriteMapper favouriteMapper;

    @Autowired
    public FavouriteServiceImpl(FavouriteMapper favouriteMapper) {
        this.favouriteMapper = favouriteMapper;
    }

    @Override
    public List<FavouriteClassify> listFavourites() {
        List<FavouriteClassify> favouriteClassifyList = favouriteMapper.selectFavourites();
        // 给没有分类的收藏项设置为默认,该类收藏项若存在则必定在第一条
        if (favouriteClassifyList.size() > 0 && StrUtil.isBlank(favouriteClassifyList.get(0).getClassify())) {
            favouriteClassifyList.get(0).setClassify("未分类");
        }
        return favouriteClassifyList;
    }

    @Override
    public PageResult<FavouriteAdminVO> listFavouritesAdminByPage(ConditionDTO condition) {
        Long count = favouriteMapper.selectFavouriteCountByCondition(condition);
        if (count == 0) {
            return new PageResult<>();
        }
        List<FavouriteAdminVO> favouriteList = favouriteMapper.selectFavouritesAdminByPage(PageUtils.getLimitCurrent(),
                PageUtils.getSize(), condition);
        return new PageResult<>(favouriteList, count);
    }

    @Override
    public List<String> listFavouriteClassifies() {
        List<String> classifyList = favouriteMapper.selectFavouriteClassifies();
        classifyList.remove("");
        return classifyList;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveOrUpdateFavourite(FavouriteDTO favouriteDTO) {
        Favourite existFavourite = this.getOne(new LambdaQueryWrapper<Favourite>()
                .select(Favourite::getId)
                .eq(Favourite::getTitle, favouriteDTO.getTitle()));
        if (Objects.nonNull(existFavourite) && !existFavourite.getId().equals(favouriteDTO.getId())) {
            throw new ServiceException("收藏项已存在");
        }

        Favourite newFavourite = BeanCopyUtils.copyBean(favouriteDTO, Favourite.class);
        // 设置默认描述
        if (StrUtil.isBlank(newFavourite.getDescription())) {
            newFavourite.setDescription("博主很懒，什么都没有写");
        }
        this.saveOrUpdate(newFavourite);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void removeFavourites(List<Integer> favouriteIds) {
        this.removeBatchByIds(favouriteIds);
    }
}