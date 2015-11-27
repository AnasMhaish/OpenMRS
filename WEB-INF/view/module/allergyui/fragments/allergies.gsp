<%  
    ui.includeCss("allergyui", "allergies.css")
%>

<div class="info-section allergies">
    <div class="info-header">
        <i class="icon-medical"></i>
        <h3>${ ui.message("allergyui.allergies").toUpperCase() }</h3>
        <i class="icon-pencil edit-action right" title="${ ui.message("coreapps.edit") }" onclick="location.href='${ui.pageLink("allergyui", "allergies", [patientId: patient.patient.id])}';"></i>
    </div>
    <div class="info-body">
        <% if (allergies.allergyStatus != "See list") { %>
			 ${ ui.message(allergies.allergyStatus) }
		<% } else { %>
        <ul>
            <% allergies.each { allergy -> %>
	            <li>
	            	<span class="allergen">  <% if (!allergy.allergen.coded) { %>"<% } %>${ ui.format(allergy.allergen.coded ? allergy.allergen.codedAllergen : allergy.allergen) }<% if (!allergy.allergen.coded) { %>"<% } %>  </span>
	            	<% allergy.reactions.eachWithIndex { reaction, index -> %>
	            		<span class="allergyReaction"><% if (index > 0) { %>,<% } else { %> &rArr; <% } %> ${ui.format(reaction.reactionNonCoded ? reaction : reaction.reaction)}</span>
	            	<% } %>
	            </li>
            <% } %>
        </ul>
		<% } %>
    </div>
</div>