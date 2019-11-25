package com.crowdfunding.service.impl;

import com.crowdfunding.bean.Role;
import com.crowdfunding.bean.RolePermission;
import com.crowdfunding.dao.RoleMapper;
import com.crowdfunding.service.RoleService;
import com.crowdfunding.util.Page;
import com.crowdfunding.vo.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Override
    public Page queryPage(Map<String,Object> map) {
        Page<Role> page =new Page<Role>((Integer) map.get("pageno"),(Integer)map.get("pagesize"));
        Integer startIndex=page.getStartIndex();
        map.put("startIndex",startIndex);
        List<Role> data=roleMapper.queryPage(map);
        page.setData(data);
        Integer totalsize=roleMapper.queryCount(map);
        page.setTotalsize(totalsize);
        return page;
    }

    @Override
    public int save(Role role) {
        return roleMapper.insert(role);
    }

    @Override
    public int deleteRoleById(Integer id) {
        return roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int deleteBatch(String[] ids) {
        return 0;
    }


    @Override
    public int deleteBatch(Integer[] ids) {
        return roleMapper.deleteBatch(ids);
    }

    @Override
    public int saveRolePermissionRelationship(Integer roleid, Data datas) {
        roleMapper.deleteRolePermissionRelationship(roleid);
        List<Integer>ids=datas.getIds();
        int total=0;
        for (Integer permissionId: ids) {
            RolePermission rp=new RolePermission();
            rp.setPermissionid(permissionId);
            rp.setRoleid(roleid);
            int count=roleMapper.insertRolePermissionRelationship(rp);
            total+=count;
        }
        return total;
    }
}
