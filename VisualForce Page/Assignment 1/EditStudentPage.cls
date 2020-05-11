<apex:page standardController="Student__c">
   <apex:form >
       <apex:pageBlock title="Student Detail" mode="edit">
<apex:pageBlockSection showHeader="false" columns="2">
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
                   <apex:commandButton action="{!save}" value="Save"/>
               </apex:pageBlockButtons>
           </apex:pageBlock>
   </apex:form>  
</apex:page>
