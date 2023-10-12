package com.juliy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.juliy.entity.Menu;
import com.juliy.model.dto.ConditionDTO;
import com.juliy.model.dto.MenuDTO;
import com.juliy.model.vo.MenuTree;
import com.juliy.model.vo.MenuVO;
import com.juliy.model.vo.RouterVO;

import java.util.List;

/**
 * 菜单服务接口
 * @author juliy
 * @date 2023/3/13 11:57
 */
public interface MenuService extends IService<Menu> {

    /**
     * 根据用户ID查询菜单树信息
     * @param userId 用户ID
     * @return 菜单列表
     */
    List<Menu> listMenuTreeByUserId(int userId);

    /**
     * 构建前端路由所需要的菜单
     * @param menus 菜单列表
     * @return 路由列表
     */
    List<RouterVO> buildMenus(List<Menu> menus);

    /**
     * 获取菜单列表
     * @param condition 查询条件
     * @return 菜单列表
     */
    List<MenuVO> listMenus(ConditionDTO condition);

    /**
     * 获取菜单树
     * @return 菜单树
     */
    List<MenuTree> listMenuTree();

    /**
     * 获取菜单选项树
     * @return 菜单选项树
     */
    List<MenuTree> listMenuOptionTree();

    /**
     * 添加或修改菜单
     * @param menu 菜单
     */
    void saveOrUpdateMenu(MenuDTO menu);

    /**
     * 删除菜单
     * @param menuId 菜单id
     */
    void removeMenu(Integer menuId);

}
