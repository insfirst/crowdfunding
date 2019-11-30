package com.crowdfunding.service.impl;

import com.crowdfunding.bean.Advertisement;
import com.crowdfunding.dao.AdvertisementMapper;
import com.crowdfunding.service.AdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdvertisementServiceImpl implements AdvertisementService {
    @Autowired
    private AdvertisementMapper advertisementMapper;

    @Override
    public int addAdvert(Advertisement advert) {
        return advertisementMapper.insert(advert);
    }
}
