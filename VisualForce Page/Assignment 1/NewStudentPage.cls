<apex:page standardController="Student__c" >
       <apex:form >
           <apex:pageBlock title="New Student">
               <apex:pageBlockSection >
                   <apex:inputField value="{!Student__c.Class_object__c}"/>
                   <apex:inputField value="{!Student__c.DOB__c}"/>
                   <apex:inputField value="{!Student__c.Email__c}"/>
                   <apex:inputField value="{!Student__c.First_Name__c}"/>
                   <apex:inputField value="{!Student__c.LastName__c}"/>
                   <apex:inputField value="{!Student__c.Married__c}"/>
                   <apex:inputField value="{!Student__c.Sex__c}"/>
                   <apex:inputField value="{!Student__c.Spouse_Name__c}"/>
                   <apex:inputField value="{!Student__c.Name}"/>
               </apex:pageBlockSection>
            <apex:pageBlockButtons >
                   <apex:commandButton value="Save" action="{!save}" />
               </apex:pageBlockButtons>
           </apex:pageBlock>
       </apex:form>
</apex:page>