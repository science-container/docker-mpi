import plotly.plotly as py
import plotly.graph_objs as go


trace1 = go.Bar(
		text=dict(family='Courier New, monospace',size=14,color='#000000'),
		x =["InfiniBand<br>Bare Metal",
		"InfiniBand<br>Docker Container",
		"Ethernet<br>Bare Metal",
		"Ethernet<br>Docker Container"],
		y=[24074.989,	24064.721,	82972.837,	82994.497
		]
	       )
data = [trace1]

layout = go.Layout(
		margin = dict(l = 100, r = 0, b = 150, t = -100),
		bargap=0.5,
		barmode='group',
		title="OSU - InfiniBand vs. Ethernet",
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),

		xaxis=dict( 
			title='Interconnection Methods',
			titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
			tickfont=dict(family='Courier New, monospace',size=16,color='#000000')
			),
		yaxis=dict(
			title="Latency ("+u'\u03bc'+"s)",
			titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
			tickfont=dict(family='Courier New, monospace',size=16,color='#000000'),
			range=[7500,85000]
			)

		)



fig = go.Figure(data=data, layout=layout)
py.image.save_as(fig, filename="osu_infiniband_ethernet.pdf") 

