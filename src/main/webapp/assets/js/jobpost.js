/**
 * 
 */
document.addEventListener('DOMContentLoaded', function() {
           const fileInput = document.getElementById('fileUpload');
           const uploadButton = document.getElementById('uploadButton');

           fileInput.addEventListener('change', function() {
               if (fileInput.files.length > 0) {
                   uploadButton.disabled = false;
               } else {
                   uploadButton.disabled = true;
               }
           });

           const form = document.getElementById('downloadForm');
           form.addEventListener('submit', function(event) {
               event.preventDefault();

               const fileType = document.querySelector('input[name="fileType"]:checked').value;
               let actionUrl = '';
			   
			   
               if (fileType === 'preFilled') {
                   actionUrl = 'existingData';
               } else if (fileType === 'template') {
                   actionUrl = 'blankTemplate';
               }

               const downloadForm = document.createElement('form');
               downloadForm.method = 'POST';
               downloadForm.action = actionUrl;

               document.body.appendChild(downloadForm);
               downloadForm.submit();
           });
       });
	   
	   $('#logout-link').click(function () {
	           $('#logoutModal').modal('show');
	       });

	       $('#confirmLogout').click(function () {
	           window.location.href = "employersLogout";
	       });
		   
		   
//		  toast message
		       function showToast(message, type) {
		           var toastContainer = document.getElementById('toast-container');
		           var toast = document.createElement('div');
		           toast.className = 'toast ' + type;
		           toast.textContent = message;

		           toastContainer.appendChild(toast);

		        
		           setTimeout(function() {
		               toast.classList.add('show');
		           }, 100);

		         
		           setTimeout(function() {
		               toast.classList.remove('show');
		               setTimeout(function() {
		                   toastContainer.removeChild(toast);
		               }, 500); 
		           }, 3000);
		       }

		      
		       var message = '${message}';
		       var messageType = '${messageType}'; 

		       if (message) {
		           showToast(message, messageType);
		       }
		 	   
	   