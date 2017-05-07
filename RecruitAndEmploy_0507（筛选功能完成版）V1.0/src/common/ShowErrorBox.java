package common;

/**
 *提示错误信息
 */
public class ShowErrorBox {

    /**提示错误信息**/
    public String errorBox(String str1, String str2) {

        String str =
        " <div id=\"Layer1\" style=\"position:absolute; left:142px; top:89px; width:229px; height:139px; z-index:1\"> " +
        " <table width=\"100%\" height=\"129\" border=\"1\" cellpadding=\"1\" cellspacing=\"2\" bordercolor=\"#CCCCCC\"> "+
        " <tr> "+
        " <td align=\"center\">"+str1+"</td>"+
        " </tr>"+
        " <tr>"+
        "   <td align=\"center\">"+str2+"</td>"+
        " </tr>"+
        " <tr>"+
        "   <td height=\"35\" align=\"center\">"+
        "     <input type=\"submit\" name=\"ok\" value=\"\u3000\u786E \u5B9A\u3000\"></td>"+
        " </tr> "+
        " </table> "+" </div> ";
        return str;

    }
}
