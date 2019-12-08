package com.crowdfunding.service.impl;

import com.crowdfunding.bean.Advertisement;
import com.crowdfunding.dao.AdvertisementMapper;
import com.crowdfunding.service.AdvertisementService;
import com.crowdfunding.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class AdvertisementServiceImpl implements AdvertisementService {
    @Autowired
    private AdvertisementMapper advertisementMapper;

    @Override
    public int addAdvert(Advertisement advert) {
        return advertisementMapper.insert(advert);
    }

    @Override
    public Page<Advertisement> queryAdvertsByPage(Map<String,Object>map) {
        Page<Advertisement>page=new Page<>((Integer)map.get("pageno"),(Integer)map.get("pagesize"));
        Integer startIndex=page.getStartIndex();
        map.put("startIndex",startIndex);
        page.setData(advertisementMapper.queryAdvertsByPage(map));
        page.setTotalsize(advertisementMapper.queryCount(map));
        return page;
    }

    @Override
    public int deleteById(Integer id) {
        return advertisementMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int deleteByIds(Integer[] ids) {
        int sum=0;
        for (Integer id:ids) {
            int count=advertisementMapper.deleteByPrimaryKey(id);
            sum+=count;
        }
        return sum;
    }
}
