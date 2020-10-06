package com.zht.projectinfo.service.impl;

import com.zht.projectinfo.mapper.ProjectinfoMapper;
import com.zht.projectinfo.pojo.Projectinfo;
import com.zht.projectinfo.pojo.ProjectinfoExample;
import com.zht.projectinfo.service.ProService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-10-06 16:25
 */
@Service("proService")
public class ProServiceImpl implements ProService{

    @Resource
    ProjectinfoMapper projectinfoMapper;

    @Override
    public List<Projectinfo> selAll(int status) {
        ProjectinfoExample example = new ProjectinfoExample();
        ProjectinfoExample.Criteria criteria = example.createCriteria();
        List<Projectinfo> projectinfos = null;
        if(status == 3){
            projectinfos = projectinfoMapper.selectByExample(null);
        }else{
            criteria.andStatusEqualTo(status);
            projectinfos = projectinfoMapper.selectByExample(example);
        }
        return projectinfos;
    }

    @Override
    public Projectinfo selById(Long id) {
        Projectinfo projectinfo = projectinfoMapper.selectByPrimaryKey(id);
        return projectinfo;
    }

    @Override
    public int upd(Projectinfo projectinfo) {
        int i = projectinfoMapper.updateByPrimaryKeySelective(projectinfo);
        return i;
    }
}
