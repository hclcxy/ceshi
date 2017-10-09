package com.shanshan.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.shanshan.bean.TrainingCourseBean;
import com.shanshan.common.model.JsonDataResult;
import com.shanshan.common.model.JsonResult;
import com.shanshan.common.model.PageRequest;
import com.shanshan.service.TrainingCourseService;

/**
 * 培训课程
 * @author PH_Zhou
 *
 */
@Controller
@RequestMapping( "/trainingCourse" )
public class TrainingCourseController {

	private TrainingCourseService trainingCourseService;
	
	/**
	 * 活动列表
	 * @return
	 */
	@RequestMapping("/trainingCourseList")
	@ResponseBody
	public JsonResult trainingCourseList(TrainingCourseBean entity, PageRequest page) {
		JsonDataResult<List<TrainingCourseBean>> result = new JsonDataResult<>();
		Page<TrainingCourseBean> datas = trainingCourseService.trainingCourseList(entity, page);
		result.setDatas(datas);
		return result;
	}
	
	/**
	 * 活动详情
	 * @return
	 */
	@RequestMapping("/trainingCourseDetail")
	@ResponseBody
	public JsonResult trainingCourseDetail(TrainingCourseBean entity) {
		JsonDataResult<TrainingCourseBean> result = new JsonDataResult<>();
		if (null == entity.getTrainingCourseId() || 0 == entity.getTrainingCourseId()) {
			result.setErrorCode("培训课程id不能为空!");
			return result;
		}
		TrainingCourseBean data = trainingCourseService.trainingCourseDetail(entity);
		result.setDatas(data);
		return result;
	}
	
}
