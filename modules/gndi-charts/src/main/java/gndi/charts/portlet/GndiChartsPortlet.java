package gndi.charts.portlet;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.ws.rs.core.MediaType;

import javax.portlet.Portlet;

import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;
import javax.json.JsonObject;

import org.osgi.service.component.annotations.Component;

import gndi.charts.constants.GndiChartsPortletKeys;

/**
 * @author renato
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + GndiChartsPortletKeys.GndiCharts,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class GndiChartsPortlet extends MVCPortlet {
	
	public void render(javax.portlet.RenderRequest renderRequest, javax.portlet.RenderResponse renderResponse)
		throws java.io.IOException ,javax.portlet.PortletException {

		Client client = ClientBuilder.newClient();
		
		WebTarget target = client.target("https://gndihackatonapi-customer.wedeploy.io/company-summary");
		
		JsonObject response = target.request(MediaType.APPLICATION_JSON).get(JsonObject.class);
		
		System.out.println(response);
	};
}