<apex:page controller="ManageClassController" >
    <apex:form >
    	<apex:pageBlock title="Class Details" id="classList">
        	<apex:pageBlockTable value="{!Classes}" var="class">
            	<apex:column value="{!class.Name}"/>
                <apex:column value="{!class.Board__c}"/>
                <apex:column value="{!class.NoOfStudents__c}"/>
                <apex:column value="{!class.MaxSize__c}" />
                <apex:column value="{!class.MyCount__c }" />
                <apex:column >
                        <apex:commandLink value="Edit" action="{!EditClass}" reRender="EditClassList">
                            <apex:param name="ClassId" assignTo="{!ClassId}" value="{!class.Id}" />
                        </apex:commandLink>
                    </apex:column>
                <apex:column >
                    <apex:commandLink value="Delete" action="{!DeleteClass}" reRender="classList">
                    <apex:param name="ClassId" assignTo="{!ClassId}" value="{!class.Id}" />
                    </apex:commandLink>
                </apex:column>
                
            </apex:pageBlockTable>
            
            <apex:pageBlock id="EditClassList">
            	<apex:pageBlockSection rendered="{!render}" title="Edit Class Details">
                	<apex:inputField value="{!SelectedClass.Name}"/>
                    <apex:inputField value="{!SelectedClass.Board__c}"/>
                    <apex:inputField value="{!SelectedClass.NoOfStudents__c}"/>
                    <apex:inputField value="{!SelectedClass.MaxSize__c}"/>
                    <apex:inputField value="{!SelectedClass.MyCount__c}"/>
                </apex:pageBlockSection>
                <apex:pageBlockButtons location="top" rendered="{!render}">
                	<apex:commandButton value="Save" action="{!UpdateClass}"/>
                </apex:pageBlockButtons>
            </apex:pageBlock>
        </apex:pageBlock>
    </apex:form>
</apex:page>