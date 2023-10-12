package com.juliy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.juliy.entity.Menu;
import com.juliy.model.dto.ConditionDTO;
import com.juliy.model.vo.MenuTree;
import com.juliy.model.vo.MenuVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 菜单mapper
 * @author juliy
 * @date 2023/3/13 12:10
 */
@Mapper
public interface MenuMapper extends BaseMapper<Menu> {


    /**
     * 查询所有菜单
     * @return 菜单列表
     */
    List<Menu> selectMenuTreeAll();

    /**
     * 根据用户id查询菜单
     * @param userId 用户id
     * @return 菜单列表
     */
    List<Menu> selectMenuTreeByUserId(@Param("userId") Integer userId);

    /**
     * 查询所有权限
     * @return 权限列表
     */
    List<String> selectPermissionAll();

    /**
     * 根据角色id查询对应权限
     * @param roleId id
     * @return 权限列表
     */
    List<String> selectPermissionByRoleId(@Param("roleId") String roleId);

    /**
     * 查询菜单列表
     * @param condition 查询条件
     * @return 菜单列表
     */
    List<MenuVO> selectMenuList(@Param("condition") ConditionDTO condition);

    /**
     * 查询菜单树
     * @return 菜单树
     */
    List<MenuTree> selectMenuTree();

    /**
     * 查询菜单选项树
     * @return 菜单选项树
     */
    List<MenuTree> selectMenuOptionTree();
}
