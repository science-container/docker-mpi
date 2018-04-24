import plotly.plotly as py
import plotly.graph_objs as go


trace1 = go.Bar(
		text=dict(family='Courier New, monospace',size=14,color='#000000'),
		x =["InfiniBand<br>Bare Metal",
		"InfiniBand<br>Host Container",
		"Ethernet<br>Bare Metal",
		"Ethernet<br>Host Container"],
		y=[4213375.45,	4209725.12,	653820.84,	602075.23
		]
	       )
data = [trace1]

layout = go.Layout(
		margin = dict(l = 100, r = 0, b = 150, t = -100),
		bargap=0.5,
		barmode='group',
		title="KMI Hash - InfiniBand vs. Ethernet",
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),

		xaxis=dict( 
			title='Interconnection Methods',
			titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
			tickfont=dict(family='Courier New, monospace',size=16,color='#000000')
			),
		yaxis=dict(
			title='Queries per Second',
			titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
			tickfont=dict(family='Courier New, monospace',size=16,color='#000000'),
			range=[500000,5000000]
			)

		)



fig = go.Figure(data=data, layout=layout)
py.image.save_as(fig, filename="hash_infiniband_ethernet.pdf") 

