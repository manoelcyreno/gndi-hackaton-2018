<%@ include file="/init.jsp" %>

<script type="text/javascript">
	var dependentCount;
	var ownerCount;

	$(document).ready(function() {
		$.ajax({
			url: "https://gndihackatonapi-customer.wedeploy.io/company-summary",
			method: "GET",
			dataType: "json"
		}).done(function(data) {
			dependentCount = data.dependentCount;
			ownerCount = data.ownerCount;
		})
		.fail(function() {
			console.log("Erro requisicão.")
		});
	});
</script>

<p>
	<b><liferay-ui:message key="gndicharts.caption"/></b>
</p>

<%
DonutChartConfig _donutChartConfig = new DonutChartConfig();

_donutChartConfig.addColumns(
  new SingleValueColumn("Titulares", 30),
  new SingleValueColumn("Dependentes", 70)
);

GaugeChartConfig _gaugeChartConfig = new GaugeChartConfig();

_gaugeChartConfig.addColumns(
  new SingleValueColumn("Sinistralidade", 30)
);

SplineChartConfig _splineChartConfig = new SplineChartConfig();

_splineChartConfig.addColumns(
	new MultiValueColumn("data1", 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 20, 30),
	new MultiValueColumn("data2", 100, 20, 30, 100, 20, 30, 100, 20, 30, 100, 20, 30),
	new MultiValueColumn("data3", 100, 20, 30, 100, 20, 30, 100, 20, 30, 100, 20, 30),
	new MultiValueColumn("data4", 100, 20, 30, 100, 20, 30, 100, 20, 30, 100, 20, 30),
	new MultiValueColumn("data5", 20, 70, 100, 20, 70, 100, 20, 70, 100, 20, 70, 100)
);

%>

<div class="container">
	<div class="row">
		<div class="col-xs-6">
			<chart:donut
				config="<%= _donutChartConfig %>"
			/>
		</div>
		<div class="col-xs-6">
			<chart:gauge
			config="<%= _gaugeChartConfig %>"
			/>
		</div>
	</div>
		<div class="row">
			<div class="col-xs-12">
				<chart:spline
					config="<%= _splineChartConfig %>"
				/>
			</div>
		</div>	
	</div>
</div>