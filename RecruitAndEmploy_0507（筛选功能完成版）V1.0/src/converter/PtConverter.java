package converter;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import entity.Point;

public class PtConverter extends StrutsTypeConverter{


	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		// TODO Auto-generated method stub
		List<Point> pt =null;
		if(values !=null&&values.length>=0)
		{
			pt= new ArrayList<Point>();
			String[] ptValues =values[0].split(",");
			for(int i=0;i<ptValues.length/2;i++)
			{
				Point point=new Point();
				point.setX(Integer.parseInt(ptValues[2*i]));
				point.setY(Integer.parseInt(ptValues[1+(2*i)]));
				pt.add(point);
			}
		}
		return pt;
	}

	@Override
	public String convertToString(Map context, Object o) {
		// TODO Auto-generated method stub
		return null;
	}

}
