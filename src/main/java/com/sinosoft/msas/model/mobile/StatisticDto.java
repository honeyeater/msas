package com.sinosoft.msas.model.mobile;

import java.util.List;

public class StatisticDto {

	private OutLineDto outLineDto;// 总项统计信息
	private List<TimeLineResDto> timeLineResDtos;// 按时间统计结果
	private List<ComcodeResDto> comcodeResDtos;// 按机构统计结果
	private List<ClassResDto> classResDtos;// 按险类统计结果

	public OutLineDto getOutLineDto() {
		return outLineDto;
	}

	public void setOutLineDto(OutLineDto outLineDto) {
		this.outLineDto = outLineDto;
	}

	public List<TimeLineResDto> getTimeLineResDtos() {
		return timeLineResDtos;
	}

	public void setTimeLineResDtos(List<TimeLineResDto> timeLineResDtos) {
		this.timeLineResDtos = timeLineResDtos;
	}

	public List<ComcodeResDto> getComcodeResDtos() {
		return comcodeResDtos;
	}

	public void setComcodeResDtos(List<ComcodeResDto> comcodeResDtos) {
		this.comcodeResDtos = comcodeResDtos;
	}

	public List<ClassResDto> getClassResDtos() {
		return classResDtos;
	}

	public void setClassResDtos(List<ClassResDto> classResDtos) {
		this.classResDtos = classResDtos;
	}

}
