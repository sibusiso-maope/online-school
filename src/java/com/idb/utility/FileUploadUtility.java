package com.idb.utility;

import com.idb.model.Students;
import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author SAIFUL
 */
public class FileUploadUtility {

    private static final String ABS_PATH = "C:\\Users\\Sibusiso\\git\\online-school\\web\\WEB-INF\\image";
    private static String REL_PATH = "";
    private static final Logger logger = LoggerFactory.getLogger(FileUploadUtility.class);

    public static void uploadFileStudent(com.idb.controller.HttpServletRequest request, MultipartFile s_img, String s_name, int roll_no) {
        REL_PATH = ((Object) request.getSession()).getServletContext().getRealPath("/resource/images/");
        logger.info(REL_PATH);
        if (!new File(ABS_PATH).exists()) {
            new File(ABS_PATH).mkdirs();
        }
        if (!new File(REL_PATH).exists()) {
            new File(REL_PATH).mkdirs();
        }
        try {
            s_img.transferTo(new File(REL_PATH + s_name + "_" + roll_no + ".jpg"));
            s_img.transferTo(new File(ABS_PATH + s_name + "_" + roll_no + ".jpg"));
        } catch (IOException e) {
        }

    }

    public static void uploadFileTeacher(HttpServletRequest request, MultipartFile t_img, String t_name, int p_number) {
        REL_PATH = ((Object) request.getSession()).getServletContext().getRealPath("/resource/images/");
        logger.info(REL_PATH);
        if (!new File(ABS_PATH).exists()) {
            new File(ABS_PATH).mkdirs();
        }
        if (!new File(REL_PATH).exists()) {
            new File(REL_PATH).mkdirs();
        }
        try {
            t_img.transferTo(new File(REL_PATH + t_name + "_" + p_number + ".jpg"));
            t_img.transferTo(new File(ABS_PATH + t_name + "_" + p_number + ".jpg"));
        } catch (IOException e) {
        }
    }


	public static void uploadFileStudentt(HttpServletRequest request, MultipartFile s_img,
			String s_name, int roll_no) {
		// TODO Auto-generated method stub
		
	}

	public static void uploadFileTeacher(com.idb.controller.HttpServletRequest request, MultipartFile t_img,
			String t_name, int p_number) {
		// TODO Auto-generated method stub
		
	}
}
