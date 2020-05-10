public class PdfGeneratorControllerForStudent {
	public Id studentId;
    public PdfGeneratorControllerForStudent(ApexPages.StandardController controller){
        studentId = apexpages.currentpage().getparameters().get('id');
    }    	
    	public PageReference saveStudentPDF(){
        PageReference pdf = Page.GenerateStudentDetailsPDF;
        pdf.getParameters().put('id',studentId);
        Attachment attach = new Attachment();
        Blob body;
        try{
            body = pdf.getContentAsPDF();
            
        }catch(VisualforceException e) {
            body = Blob.valueOf('Error');
        }
        attach.Body = body;
        attach.Name = 'StudentPdfId'+studentId + '.pdf';
        attach.ParentId = studentId;
        attach.IsPrivate = false;
        
        List<Attachment> attachmentList = [SELECT Id, ParentId FROM Attachment WHERE ParentId = : studentId];
        if(attachmentList.size() > 0)
        {
            delete attachmentList[0];
        }
		insert attach;
        PageReference renderOnPage = new PageReference('/'+ studentId);
        renderOnPage.setRedirect(true);
        return renderOnPage;
    }
}
