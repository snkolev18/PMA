let statistics = undefined;
(async function() {
	let statisticsJSON = await fetch("/admin/getstatistics", {method: "GET", mode: "no-cors"});
	statistics = await statisticsJSON.json();
})();

google.charts.load("current", {"packages":["corechart"]});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
	let data = google.visualization.arrayToDataTable([
		["Information", "Number of entities"],
		["Users", statistics.users.count],
		["Teams", statistics.teams.count],
		["Projects", statistics.projects.count],
		["Tasks", statistics.tasks.count]
	]);

	// Optional; add a title and set the width and height of the chart
	let options = {"title":"System statistics", "width":700, "height":500};

	// Display the chart inside the <div> element with id="piechart"
	let chart = new google.visualization.PieChart(document.getElementById("piechart"));
	chart.draw(data, options);
}