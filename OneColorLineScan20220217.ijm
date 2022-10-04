//This macro was created by Salvatore J. Cherra, PhD.
//This macro assists in the performance of line scan analysis.
//Use this macro to quantify the intensity of synapses or bright spots.

macro "Draw line [a]" {
	//clear log and results
	print("\\Clear");
	run("Clear Results");
	run("Set Measurements...", "area mean center redirect=None decimal=3");

	//print instructions for user
	print("Adjust contrast and focus on synapses.");
	print("Draw line along puncta that are in focus.");
	print("Double-click to end the line.");
	print("Then press command/control 'b'.");
	
	//select segmented line tool
	setTool("polyline");
	
	//set line width to 10 pixels
	run("Line Width...", "line=10");
	
	//open brightness and contrast window
	run("Brightness/Contrast...");
}

macro "Plot profile [b]" {
	//clear log
	print("\\Clear");
	
	//print instructions for user
	print("Use mouse to draw line connecting troughs of curve.");
	print("Double-click to end the line.");
	print("Then press command/control 'c'.");
	
	//plot profile of line
	run("Plot Profile");
	Plot.setAxisLabelSize(14.0, "plain");
	Plot.setFontSize(14.0);
	Plot.setXYLabels("Distance (microns)", "Gray Value");
	Plot.setFormatFlags("11001100001111");
	
	//set line width to 2 pixels and choose black fill for line
	run("Line Width...", "line=2");
	setForegroundColor(4, 4, 4);
}

macro "Measure area [c]" {
	//clear log
	print("\\Clear");

	//print instructions for user
	print("Click mouse and press command/control 'm' \n to measure area of peaks.");
	print("When finished, press command/control 'd' \n to copy results.");
	
	//draws line to graph and selects wand tool for next step.
	run("Draw", "slice");
	setTool("wand");
}

macro "Copy results [d]" {
	//copy results to clipboard
	String.copyResults();
	print("\\Clear");
	run("Close All");
}
