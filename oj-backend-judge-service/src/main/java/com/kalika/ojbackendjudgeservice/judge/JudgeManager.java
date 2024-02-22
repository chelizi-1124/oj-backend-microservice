package com.kalika.ojbackendjudgeservice.judge;


import com.kalika.ojbackendjudgeservice.judge.strategy.DefaultJudgeStrategy;
import com.kalika.ojbackendjudgeservice.judge.strategy.JavaLanguageJudgeStrategy;
import com.kalika.ojbackendjudgeservice.judge.strategy.JudgeContext;
import com.kalika.ojbackendjudgeservice.judge.strategy.JudgeStrategy;
import com.kalika.ojbackendmodel.model.codesandbox.JudgeInfo;
import com.kalika.ojbackendmodel.model.entity.QuestionSubmit;
import org.springframework.stereotype.Service;

/**
 * 判题管理（简化调用）
 */
@Service
public class JudgeManager {

    /**
     * 执行判题
     *
     * @param judgeContext
     * @return
     */
    JudgeInfo doJudge(JudgeContext judgeContext) {
        QuestionSubmit questionSubmit = judgeContext.getQuestionSubmit();
        String language = questionSubmit.getLanguage();
        JudgeStrategy judgeStrategy = new DefaultJudgeStrategy();
        if ("java".equals(language)) {
            judgeStrategy = new JavaLanguageJudgeStrategy();
        }
        return judgeStrategy.doJudge(judgeContext);
    }

}
