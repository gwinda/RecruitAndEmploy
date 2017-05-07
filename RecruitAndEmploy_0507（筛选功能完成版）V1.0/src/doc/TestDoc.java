package doc;

import java.awt.Image;
import java.util.HashMap;
import java.util.Map;

public class TestDoc {
    public static void main(String[] args) {
        DocUtil docUtil=new DocUtil();
        Map<String, Object> dataMap=new HashMap<String, Object>();
        dataMap.put("name", "Joanna");
        dataMap.put("phone", "111111111111");
        dataMap.put("sex", "222222222222222222");
        dataMap.put("householdRegiste", "C1");
        dataMap.put("education", "测试驾校");
        dataMap.put("school", "初次申领");
        dataMap.put("birth", "2016-03-10");
        dataMap.put("mailbox", "第1次");
        dataMap.put("hobby", "第1次");
        //dataMap.put("userImg1", docUtil.getImageStr("D:\\Img\\userImg1.png"));
        //dataMap.put("userImg2", docUtil.getImageStr("D:\\Img\\userImg2.png"));
        dataMap.put("firstExamTime", "12:41:17-12:44:38");
       // dataMap.put("picture", "0分，不及格");
        dataMap.put("politicalStatus", "12:44:15 20102 1号倒车入库，车身出线 扣100分");
        //Image img = Image.getInstance("d:\\img01800.jpg"); 
        String saveFilePath="F:\\客户有用\\images\\1.jpg";
        saveFilePath=saveFilePath.replace("\\", "\\\\");  
        StringBuilder str=new StringBuilder();  
      	//取得图片的base64码  
        str.append(docUtil.getImageBinary(saveFilePath));  
      	//images=str.toString();//images就是图片的base64码  
        dataMap.put("picture", docUtil.getImageStr("F:\\客户有用/images/1.jpg"));
       // dataMap.put("firstPic2", docUtil.getImageStr("D:\\Img\\firstPic2.png"));
       // dataMap.put("firstPic3", docUtil.getImageStr("D:\\Img\\firstPic3.png"));
        dataMap.put("nation", "12:46:50-13:05:37");
        dataMap.put("address", "90分，通过");
        dataMap.put("awardSituation", "");
        dataMap.put("HandsOnBackground", "");
       // dataMap.put("secondPic1", docUtil.getImageStr("D:\\Img\\secondPic1.png"));
       // dataMap.put("secondPic2", docUtil.getImageStr("D:\\Img\\secondPic2.png"));
        //dataMap.put("secondPic3", docUtil.getImageStr("D:\\Img\\secondPic3.png"));
        docUtil.createDoc(dataMap, "2678", "F:\\yan1.doc");
    }
}
