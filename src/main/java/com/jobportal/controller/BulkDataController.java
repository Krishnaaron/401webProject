package com.jobportal.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jobportal.model.Employers;
import com.jobportal.model.Jobs;
import com.jobportal.service.JobsService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class BulkDataController {
	private static final Logger LOGGER = LogManager.getLogger(BulkDataController.class);

	@Autowired
	private JobsService jobsService;
    
	private String uploadedFolder;

	@PostMapping("/blankTemplate")
	protected void downloadSampleTemplate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LOGGER.info("Job posting Templatecontroller {}");
		sendFile(response, jobsService.createFile(), "jobPostBlankTemplate.xlsx");
	}
	@PostMapping("/existingData")
	protected void downloadJobsData(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		Employers employers = (Employers) session.getAttribute("employers");
		int id = employers.getId();
		LOGGER.info("Download Existing data Controller based on employer {}", employers.getId());
		sendFile(response, jobsService.downloadJobs(id), "ExistingData.xlsx");
	}

	@PostMapping("/fileupload")
	public String uploadFile(@RequestParam("file") MultipartFile file, @RequestParam("id") int id, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletResponse response, Model model) {

		try {
			Path path = Paths.get(uploadedFolder + StringUtils.cleanPath(file.getOriginalFilename()));
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

			if (path.toString() == null) {
				LOGGER.error("File uploading path not found", path.toString());
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
				return "errorPage";
			}

			
			session.setAttribute("filePath", path.toString());
			session.setAttribute("id", id);
			Jobs jobUpdateResponse = jobsService.updateJobs(path.toString(), id);
			System.out.println(jobUpdateResponse.isStatus());
			if (jobUpdateResponse.isStatus()) {
			    redirectAttributes.addFlashAttribute("message", "File updated successfully!");
			} else {
			    redirectAttributes.addFlashAttribute("error", "File update failed.");
			}
			session.setAttribute("jobUpdateResponse", jobUpdateResponse);
			//sendFile(response, jobUpdateResponse.getByteArrayInputStream(), "updatedData.xlsx");
			return "redirect:/postjob";

		} catch (IOException e) {
			LOGGER.error("File uploading problem", e);
			redirectAttributes.addFlashAttribute("error", "Failed to upload file.");
			return "redirect:/postjob"; // Handle the exception by showing an error page
		}
	}
	@RequestMapping("/updateData")
    public void updatedData(HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttributes) {

		HttpSession session = request.getSession();
		Jobs jobs = (Jobs) session.getAttribute("jobUpdateResponse");
		if(jobs != null) {
			try {
				sendFile(response, jobs.getByteArrayInputStream(), "updatedData.xlsx");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		}
		else
			redirectAttributes.addFlashAttribute("message", "pleace upload file view the result");
		
    
    }
	private void sendFile(HttpServletResponse response, ByteArrayInputStream fileStream, String filename)
			throws IOException {
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=" + filename);
		response.setContentLength(fileStream.available());
		LOGGER.info("File Convert byte Browser Automatic Download");
		try (OutputStream out = response.getOutputStream()) {
			byte[] buffer = new byte[1024];
			int bytesRead;
			while ((bytesRead = fileStream.read(buffer)) != -1) {
				out.write(buffer, 0, bytesRead);
			}
		}
	}
	
	@GetMapping("/jobss")
    public ResponseEntity<List<Jobs>> getJobs(HttpSession session) {
        Employers employers = (Employers) session.getAttribute("employers");
        if (employers == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build(); // Or redirect if required
        }
        
        int id = employers.getId();
        List<Jobs> jobs = jobsService.viewEmployerJobs(id);

        return ResponseEntity.ok(jobs);
    }
}
