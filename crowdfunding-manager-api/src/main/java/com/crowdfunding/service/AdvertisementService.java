package com.crowdfunding.service;


import com.crowdfunding.bean.Advertisement;
import com.crowdfunding.util.Page;

import java.util.Map;

public interface AdvertisementService {

    int addAdvert(Advertisement advert);

    Page<Advertisement> queryAdvertsByPage(Map<String,Object>map);

    int deleteById(Integer id);

    int deleteByIds(Integer[] ids);
}

