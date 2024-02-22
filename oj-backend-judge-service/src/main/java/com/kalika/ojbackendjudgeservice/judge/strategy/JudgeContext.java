package com.kalika.ojbackendjudgeservice.judge.strategy;



import com.kalika.ojbackendmodel.model.codesandbox.JudgeInfo;
import com.kalika.ojbackendmodel.model.dto.question.JudgeCase;
import com.kalika.ojbackendmodel.model.entity.Question;
import com.kalika.ojbackendmodel.model.entity.QuestionSubmit;
import lombok.Data;

import java.util.List;

/**
 * 上下文（用于定义在策略中传递的参数）
 */
@Data
public class JudgeContext {

    private JudgeInfo judgeInfo;

    private List<String> inputList;

    private List<String> outputList;

    private List<JudgeCase> judgeCaseList;

    private Question question;

    private QuestionSubmit questionSubmit;

}
