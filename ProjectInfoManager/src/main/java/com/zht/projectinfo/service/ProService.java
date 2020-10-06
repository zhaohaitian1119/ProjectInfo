package com.zht.projectinfo.service;

import com.zht.projectinfo.pojo.Projectinfo;

import java.util.List;

/**
 * @author shkstart
 * @create 2020-10-06 16:24
 */
public interface ProService {
    List<Projectinfo> selAll(int status);
    Projectinfo selById(Long id);
    int upd(Projectinfo projectinfo);
}
