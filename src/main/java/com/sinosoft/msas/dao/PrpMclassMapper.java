package com.sinosoft.msas.dao;

import com.sinosoft.msas.domain.PrpMclass;
import java.util.List;

public interface PrpMclassMapper {
    int deleteByPrimaryKey(String classcode);

    int insert(PrpMclass record);

    PrpMclass selectByPrimaryKey(String classcode);

    List<PrpMclass> selectAll();

    int updateByPrimaryKey(PrpMclass record);
}