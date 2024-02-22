package com.kalika.ojbackendquestionservice.controller.inner;

import com.kalika.ojbackendmodel.model.entity.Question;
import com.kalika.ojbackendmodel.model.entity.QuestionSubmit;
import com.kalika.ojbackendquestionservice.service.QuestionService;
import com.kalika.ojbackendquestionservice.service.QuestionSubmitService;
import com.kalika.ojbackendserviceclient.service.QuestionFeignClient;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @Author 倪彤
 * @Date 2024/1/19 22:37
 * @Version 1.0
 */

@RestController
@RequestMapping("/inner")
public class QuestionInnerController implements QuestionFeignClient {

    @Resource
    private QuestionService questionService;

    @Resource
    private QuestionSubmitService questionSubmitService;

    @Override
    @GetMapping("/get/id")
    public Question getQuestionById(@RequestParam("questionId") long questionId) {
        return questionService.getById(questionId);
    }

    @Override
    @GetMapping("question_submit/get/id")
    public QuestionSubmit getQuestionSubmitById(@RequestParam("questionId") long questionSubmitId) {
        return questionSubmitService.getById(questionSubmitId);
    }

    @Override
    @PostMapping("question_submit/update")
    public boolean updateQuestionSubmitById(@RequestBody QuestionSubmit questionSubmit) {
        return questionSubmitService.updateById(questionSubmit);
    }

    @Override
    @PostMapping("question/update")
    public boolean updateQuestionById(Question question) {
        return questionService.saveOrUpdate(question);
    }
}
