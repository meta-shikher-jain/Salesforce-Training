<apex:page standardController="Class__c">
       <apex:form>
           <apex:pageBlock title="New Class">
               <apex:pageBlockSection>
                   <apex:inputField value="{!Class__c.Name}"/>
                   <apex:inputField value="{!Class__c.MaxSize__c}"/>
                   <apex:inputField value="{!Class__c.Fee__c}"/>
                   <apex:inputField value="{!Class__c.Custom_Status__c}"/>
                   <apex:inputField value="{!Class__c.ClassTeacher__c}"/>
               </apex:pageBlockSection>
            <apex:pageBlockButtons>
                   <apex:commandButton value="Save" action="{!save}"/>
               </apex:pageBlockButtons>
           </apex:pageBlock>
       </apex:form>
</apex:page>
