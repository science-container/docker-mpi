import plotly.plotly as py
import plotly.graph_objs as go


trace1 = go.Bar(
		text=dict(family='Courier New, monospace',size=14,color='#000000'),
		x =["IB with<br>Bare Metal",
		"IB  with<br>Host Container",
		"Ethernet with<br>Bare Metal",
		"Ethernet with<br>Host Container"],
		y=[63.3579,
		63.0155,
		63.1160,
		62.7430
		]
	       )
data = [trace1]

layout = go.Layout(
		margin = dict(l = 100, r = 0, b = 150, t = -100),
		bargap=0.5,
		barmode='group',
		title="HPCG - InfiniBand vs. Ethernet",
		titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),

		xaxis=dict( 
			title='Interconnection Methods',
			titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
			tickfont=dict(family='Courier New, monospace',size=16,color='#000000')
			),
		yaxis=dict(
			title='GFLOPS',
			titlefont=dict(family='Courier New, monospace',size=25,color='#000000'),
			tickfont=dict(family='Courier New, monospace',size=16,color='#000000'),
			range=[40,65]
			)

		)



fig = go.Figure(data=data, layout=layout)
py.image.save_as(fig, filename="hpcg_infiniband_ethernet.pdf") 

