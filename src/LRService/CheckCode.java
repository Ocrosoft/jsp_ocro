package LRService;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckCode")
public class CheckCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckCode() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		response.setContentType("image/png");
		String code="";
		
		File file=new File("C:\\CheckCode.png");
		BufferedImage bufferedImage =  ImageIO.read(new FileInputStream(file));
		Graphics graphics = bufferedImage.getGraphics();
		int ans=0;
		for(int i=0;i<4;i++){
			int num=(int)(Math.random()*10%10);
			ans=ans*10+num;
			int rot=(int)(Math.random()*1000%80);
			if(rot>40)rot=40-rot;
			if((int)(Math.random()*10%10)>5){
				rotateText(graphics, String.valueOf(num), rot, 8+i*15, 20);
				code+=String.valueOf(num);
			}
			else{
				String alpha=""+(char)('a'+(int)(Math.random()*100%26));
				rotateText(graphics, alpha, rot, 8+i*15, 20);
				code+=alpha;
			}
		}
		ImageIO.write(bufferedImage, "png", servletOutputStream);
		servletOutputStream.flush();
		servletOutputStream.close();
		request.getSession().setAttribute("code",code);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void rotateText(Graphics g, String s, double angle, int x, int y) 
	{ 
		Graphics2D g2d = (Graphics2D)g; 
		g2d.translate(x, y); 
		g2d.rotate(Math.PI*(angle/-180)); 
		g2d.setFont(new Font("Î¢ÈíÑÅºÚ",Font.BOLD,23));
		g2d.setColor(new Color(0, 0, 153));
		g2d.drawString(s, 0, 0); 
		g2d.rotate(-Math.PI*(angle/-180)); 
		g2d.translate(-x,-y); 
	}

}
