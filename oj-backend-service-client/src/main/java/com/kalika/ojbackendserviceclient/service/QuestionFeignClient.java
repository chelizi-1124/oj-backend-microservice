package com.kalika.ojbackendserviceclient.service;


import com.kalika.ojbackendmodel.model.entity.Question;
import com.kalika.ojbackendmodel.model.entity.QuestionSubmit;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

/**
* @author 17828
* @description 针对表【post(題目)】的数据库操作Service
* @createDate 2023-12-20 21:49:02
*/
@FeignClient(name = "oj-backend-question-service",path = "api/question/inner")
public interface QuestionFeignClient {


    @GetMapping("/get/id")
    Question getQuestionById(@RequestParam("questionId") long questionId);

    @GetMapping("question_submit/get/id")
    QuestionSubmit getQuestionSubmitById(@RequestParam("questionId") long questionSubmitId);

    @PostMapping("question_submit/update")
    boolean updateQuestionSubmitById(@RequestBody QuestionSubmit questionSubmit);

    @PostMapping("question/update")
    boolean updateQuestionById(@RequestBody Question question);

}
