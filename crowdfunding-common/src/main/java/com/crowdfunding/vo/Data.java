package com.crowdfunding.vo;


import java.util.ArrayList;
import java.util.List;


public class Data {
	private List datas=new ArrayList();
	private List<Integer>ids=new ArrayList<>();

	public List getDatas() {
		return datas;
	}

	public void setDatas(List datas) {
		this.datas = datas;
	}

	public List<Integer> getIds() {
		return ids;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
}
