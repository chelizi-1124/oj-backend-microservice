package com.kalika.ojbackendmodel.model.vo;

import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.kalika.ojbackendmodel.model.dto.question.JudgeCase;
import com.kalika.ojbackendmodel.model.dto.question.JudgeConfig;
import com.kalika.ojbackendmodel.model.entity.Question;
import lombok.Data;
import org.springframework.beans.BeanUtils;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 題目
 *
 * @TableName post
 */
@Data
@TableName(value = "question")
public class QuestionVO implements Serializable {
    /**
     * id
     */
    private Long id;

    /**
     * 标题
     */
    private String title;

    /**
     * 内容
     */
//    private String content;

    /**
     * 标签列表（json 数组）
     */
    private List<String> tags;

    /**
     * 題目答案
     */
//    private String answer;

    /**
     * 題目提交数
     */
    private Integer submitNum;

    /**
     * 題目通过数
     */
    private Integer acceptedNum;

    /**
     * 判题配置（json数组）
     */
    private JudgeConfig judgeConfig;

    private List<JudgeCase> judgeCase;


    /**
     * 创建用户 id
     */
    private Long userId;

    /**
     * 创建时间
     */
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 创建题目人的信息
     */
    private UserVO userVO;

    private static final long serialVersionUID = 1L;

    /**
     * 包装类转对象
     *
     * @param questionVO
     * @return
     */
    public static Question voToObj(QuestionVO questionVO) {
        if (questionVO == null) {
            return null;
        }
        Question question = new Question();
        BeanUtils.copyProperties(questionVO, question);
        List<String> tagList = questionVO.getTags();
        if (tagList != null) {
            question.setTags(JSONUtil.toJsonStr(tagList));
        }
        JudgeConfig voJudgeConfig = questionVO.getJudgeConfig();
        if (voJudgeConfig != null) {
            question.setJudgeConfig(JSONUtil.toJsonStr(voJudgeConfig));
        }
        return question;
    }

    /**
     * 对象转包装类
     *
     * @param question
     * @return
     */
    public static QuestionVO objToVo(Question question) {
        if (question == null) {
            return null;
        }
        QuestionVO questionVO = new QuestionVO();
        BeanUtils.copyProperties(question, questionVO);
        List<String> tagList = JSONUtil.toList(question.getTags(), String.class);
        questionVO.setTags(tagList);
        String JudgeConfigStr = question.getJudgeConfig();
        questionVO.setJudgeConfig(JSONUtil.toBean(JudgeConfigStr, JudgeConfig.class));
        String judgeCaseStr = question.getJudgeCase();
        List<JudgeCase> judgeCases = JSONUtil.toList(JSONUtil.parseArray(judgeCaseStr), JudgeCase.class);
        questionVO.setJudgeCase(judgeCases);
        return questionVO;
    }

}