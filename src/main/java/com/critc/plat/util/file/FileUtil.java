package com.critc.plat.util.file;

import com.critc.plat.util.date.DateUtil;
import com.critc.plat.util.string.StringUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

public class FileUtil {

    public static String upload(MultipartFile file, String path, HttpServletRequest request) {
        // 获取文件名
        String fileName = file.getOriginalFilename();
        String uploadfileName = fileName.substring(0,fileName.lastIndexOf("."))+ DateUtil.getShortSystemTime()+fileName.substring(fileName.lastIndexOf("."));

        // 文件上传后的路径
//        String filePath = request.getServletContext().getRealPath("//WEB-INF//views//outsource//outProject//document");
        String filePath = request.getServletContext().getRealPath(path);

        File dest = new File(filePath +"//"+ uploadfileName);

        // 检测是否存在目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }

        try {
            file.transferTo(dest);
            return uploadfileName;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //文件下载相关代码
    public static String download(String fileName, String path, HttpServletRequest request, HttpServletResponse response) throws IOException  {
        if (fileName != null) {
            String realPath = request.getServletContext().getRealPath(path);
            File file = new File(realPath, fileName);
            if (file.exists()) {
//                fileName = fileName.substring(0,fileName.lastIndexOf(".")-14)+fileName.substring(fileName.lastIndexOf("."));
                fileName = StringUtil.getRealFileName(fileName);
                response.setHeader("content-type", "application/octet-stream");

                response.setContentType("application/x-download;charset=UTF-8");// 设置强制下载不打开
                response.setHeader("Content-Disposition", "attachment;fileName=" +  new String(fileName.getBytes("UTF-8"),"iso-8859-1"));// 设置文件名

                byte[] buffer = new byte[1024];
                FileInputStream fis = null;
                BufferedInputStream bis = null;
                try {
                    fis = new FileInputStream(file);
                    bis = new BufferedInputStream(fis);
                    OutputStream os = response.getOutputStream();
                    int i = bis.read(buffer);
                    while (i != -1) {
                        os.write(buffer, 0, i);
                        i = bis.read(buffer);
                    }
                    System.out.println("success");
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        return null;
    }

    /**
     * 删除文件
     * @param fileName
     * @param path
     */
    public static boolean delete(String fileName,String path,HttpServletRequest request) {
        String realPath = request.getServletContext().getRealPath(path);
        File dest = new File(realPath +"//"+ fileName);
        if (dest.exists()){
            return dest.delete();
        }
        return false;
    }

    //多文件上传
    @RequestMapping(value = "/batch/upload", method = RequestMethod.POST)
    @ResponseBody
    public String handleFileUpload(HttpServletRequest request) {
        List<MultipartFile> files = ((MultipartHttpServletRequest) request)
                .getFiles("file");
        MultipartFile file = null;
        BufferedOutputStream stream = null;
        for (int i = 0; i < files.size(); ++i) {
            file = files.get(i);
            if (!file.isEmpty()) {
                try {
                    byte[] bytes = file.getBytes();
                    stream = new BufferedOutputStream(new FileOutputStream(
                            new File(file.getOriginalFilename())));
                    stream.write(bytes);
                    stream.close();

                } catch (Exception e) {
                    stream = null;
                    return "You failed to upload " + i + " => "
                            + e.getMessage();
                }
            } else {
                return "You failed to upload " + i
                        + " because the file was empty.";
            }
        }
        return "upload successful";
    }
}
